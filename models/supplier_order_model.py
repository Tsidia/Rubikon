# supplier_order_model.py
import pymysql
from services import get_connection, load_config
import datetime
from flask import session
from config import Config
from models.products import get_all_products, get_inventory_for_product, get_in_transit_for_product
from models.sales import get_weighted_demand
import math


def mock_external_order_api(supplier_id, product_id, quantity):
    """
    Makieta udaje zewnętrzne api dostawcy odbierające zamówienia
    """
    return {
        "success": True,
        "message": "Zamówienie przyjęte przez dostawcę!"
    }


def delete_supplier(supplier_id):
    """Usuwa dostawcę z wybranym supplier_id"""
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "DELETE FROM suppliers WHERE supplier_id=%s"
            cur.execute(sql, (supplier_id,))
        conn.commit()
    finally:
        conn.close()

def update_supplier(supplier_id, supplier_name, contact_name, phone, email, address, comment=None):
    """
    Wstawia nowe informacje o wybranym dostawcy
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            UPDATE suppliers
            SET supplier_name=%s,
                contact_name=%s,
                email=%s,
                phone_number=%s,
                address=%s,
                comment=%s
            WHERE supplier_id=%s
            """
            cur.execute(sql, (supplier_name, contact_name, email, phone, address, comment, supplier_id))
        conn.commit()
    finally:
        conn.close()
        
def add_supplier(supplier_name, contact_name, phone, email, address, comment=None):
    """
    Dodaje nowego dostawcę
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            INSERT INTO suppliers (supplier_name, contact_name, email, phone_number, address, comment, lead_time_days)
            VALUES (%s, %s, %s, %s, %s, %s, 0)
            """
            cur.execute(sql, (supplier_name, contact_name, email, phone, address, comment))
        conn.commit()
    finally:
        conn.close()

def get_supplier_by_id(supplier_id):
    """
    Zwraca słownik z polami:
      {
        'supplier_id': ...,
        'supplier_name': ...,
        'contact_name': ...,
        'email': ...,
        'phone_number': ...,
        'address': ...,
        'comment': ...,
        'lead_time_days': ...
      }
    lub None, jeśli brak dostawcy o podanym ID.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT supplier_id, 
                   supplier_name, 
                   contact_name,
                   email,
                   phone_number,
                   address,
                   comment,
                   lead_time_days
            FROM suppliers
            WHERE supplier_id = %s
            """
            cur.execute(sql, (supplier_id,))
            return cur.fetchone()  # Może być None, jeśli brak wiersza.
    finally:
        conn.close()
       


def get_all_suppliers():
    """Zwraca list of dict z wszyskimi dostawcami"""
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT supplier_id, supplier_name, contact_name, email,
                   phone_number, address, comment, lead_time_days
            FROM suppliers
            ORDER BY supplier_id
            """
            cur.execute(sql)
            return cur.fetchall()  # list of dict
    finally:
        conn.close()

def get_pending_deliveries():
    """
    SELECT * FROM supplier_orders 
    WHERE status IN ('pending','shipped')
    """
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            sql = """SELECT supplier_order_id, status, order_date, expected_delivery_date
                     FROM supplier_orders
                     WHERE status IN ('pending','shipped')"""
            cursor.execute(sql)
            return cursor.fetchall()
    finally:
        conn.close()

def get_supplier_order(order_id):
    """Znajduje zamówienie o podanym id"""
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            sql = """SELECT supplier_order_id, status FROM supplier_orders WHERE supplier_order_id=%s"""
            cursor.execute(sql, (order_id,))
            return cursor.fetchone()
    finally:
        conn.close()

def confirm_supplier_delivery(order_id):
    """
    Ustawia status zamówienia na 'delivered' 
    i dodaje do stanu magazynowego wszystkie pozycje z supplier_order_details.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            # 1. Pobierz produkty i ilości z supplier_order_details
            sql_details = """
            SELECT product_id, quantity 
            FROM supplier_order_details
            WHERE supplier_order_id = %s
            """
            cursor.execute(sql_details, (order_id,))
            details = cursor.fetchall()

            # 2. Dla każdej pozycji z 'details' dodaj do inventory
            for d in details:
                product_id = d['product_id']
                qty = d['quantity']
                # Najpierw pobierz aktualny stock
                cursor.execute("SELECT quantity_in_stock FROM inventory WHERE product_id = %s", (product_id,))
                row = cursor.fetchone()
                if row:
                    new_stock = row['quantity_in_stock'] + qty
                    cursor.execute("UPDATE inventory SET quantity_in_stock=%s WHERE product_id=%s", (new_stock, product_id))

            # 3. Ustaw status = 'delivered' w supplier_orders
            sql_update = """
            UPDATE supplier_orders
            SET status='delivered', received_date = NOW()
            WHERE supplier_order_id=%s
            """
            cursor.execute(sql_update, (order_id,))

        conn.commit()
    finally:
        conn.close()
        
def place_supplier_order_mock(product_id, quantity, user_id=1):
    """
    1) Wybiera dostawcę o najkrótszym lead_time_days
    2) Wywołuje mock external API
    3) Wstawia do supplier_orders, supplier_order_details
    Zwraca True jeśli OK, False w razie błędu
    """
    cost_map = {
    1: 24.99,  # mała kostka
    2: 34.99,  # średnia
    3: 44.99   # duża
}
    suppliers = get_all_suppliers()
    if not suppliers:
        return False

    best_supplier = min(suppliers, key=lambda s: s['lead_time_days'])
    supplier_id = best_supplier['supplier_id']
    lead_time_days = best_supplier['lead_time_days']

    response = mock_external_api(supplier_id, product_id, quantity)
    if not response['success']:
        return False

    cost_price = cost_map.get(product_id, 0.0)

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            now = datetime.datetime.now()
            expected_delivery = now + datetime.timedelta(days=lead_time_days)

            sql_orders = """
            INSERT INTO supplier_orders
              (supplier_id, order_date, expected_delivery_date, status, created_by_user_id)
            VALUES (%s, NOW(), %s, 'pending', %s)
            """
            cur.execute(sql_orders, (supplier_id, expected_delivery, user_id))
            order_id = cur.lastrowid

            sql_details = """
            INSERT INTO supplier_order_details
              (supplier_order_id, product_id, quantity, cost_price)
            VALUES (%s, %s, %s, %s)
            """
            cur.execute(sql_details, (order_id, product_id, quantity, cost_price))

        conn.commit()
    finally:
        conn.close()

    return True

def mock_external_api(supplier_id, product_id, quantity):
    """
    Makieta udaje zewnętrzne api dostawcy odbierające zamówienia
    """
    return {
      'success': True,
      'message': 'Zamówienie przyjęte przez Dostawcę.'
    }
    
def rop_eoq():
    """
     - oblicza D_weighted (uwzgl. days_range, np. n=30)
     - oblicza ROP = D_weighted * L + SS
     - sprawdza stan magazynu + in_transit
     - jeśli stan < ROP, składa zamówienie (wielkość EOQ)
     - integracja z mock external API i wstawienie do supplier_orders i details
    Na koniec wyświetla info ile zamówień zostało złożonych.
    """
    # Wczytujemy parametry z configu
    # h -> roczny koszt magazynowania
    # K -> koszt pojedynczego zamówienia
    # SS -> zapas bezpieczeństwa
    # L -> (lead_time)
    # n -> ile dni do analizy
    config = load_config()
    h = config.get('h_cost', Config.HOLDING_COST)
    K = config.get('ordering_cost', Config.ORDERING_COST)
    SS = config.get('safety_stock', Config.DEFAULT_SAFETY_STOCK)
    L = config.get('lead_time', Config.LEAD_TIME)  # w dniach
    n = config.get('days_range', Config.DAYS_RANGE)  # ile dni do obliczania D_weighted

    # Pobieramy listę produktów
    products = get_all_products()

    # Zmienna do zliczania zamówień
    orders_placed = 0

    for p in products:
        product_id = p['product_id']

        # 1) oblicz D_weighted => get_weighted_demand(product_id, n)
        D_weighted = get_weighted_demand(product_id, n)  # musisz sam zaimplementować
        ROP = D_weighted * L + SS

        # 2) sprawdzamy stan magazynu + in_transit
        inv_info = get_inventory_for_product(product_id)  # np. { 'quantity_in_stock': 50 }
        # plus in_transit => count sum z supplier_orders w statusie 'pending','shipped'
        in_transit = get_in_transit_for_product(product_id)

        stock_now = inv_info['quantity_in_stock'] + in_transit

        if stock_now < ROP:
            # 3) liczymy EOQ
            # D_annual ~ D_weighted * 365
            D_annual = D_weighted * 365
            # EOQ = sqrt(2*K*D_annual / h)
            EOQ = 0
            if D_annual > 0:
                EOQ = math.sqrt(2 * K * D_annual / h)
            EOQ = math.ceil(EOQ)  # zaokrąglamy w górę

            # 4) Składamy zamówienie do mock API
            success = place_supplier_order_mock(product_id, EOQ)
            if success:
                orders_placed += 1         
    return orders_placed