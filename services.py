import pymysql
from config import Config

def get_connection():
    """
    Zwraca połączenie do bazy danych w oparciu o dane z config.py
    """
    return pymysql.connect(
        host=Config.DB_HOST,
        user=Config.DB_USER,
        password=Config.DB_PASS,
        database=Config.DB_NAME,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=False  # transakcyjnie
    )

def save_config(safety_stock, ordering_cost, holding_cost, lead_time):
    """
    Zapisuje parametry algorytmu do tabeli `configuration`.
    Jeśli klucz istnieje - aktualizuje, jeśli nie - wstawia.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # Dla uproszczenia - 4 klucze
            data = {
                "DEFAULT_SAFETY_STOCK": str(safety_stock),
                "ORDERING_COST": str(ordering_cost),
                "HOLDING_COST": str(holding_cost),
                "LEAD_TIME": str(lead_time)
            }
            for k, v in data.items():
                sql = """
                INSERT INTO configuration (conf_key, conf_value)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE conf_value = VALUES(conf_value)
                """
                cur.execute(sql, (k, v))

        conn.commit()
    finally:
        conn.close()

def load_config():
    """
    Wczytuje parametry algorytmu z tabeli `configuration`.
    Jeśli nie ma jakiegoś klucza, używa wartości z config.py (domyślnej).
    Zwraca dict:
        {
          'safety_stock': float,
          'ordering_cost': float,
          'holding_cost': float,
          'lead_time': float
        }
    """
    defaults = {
        'safety_stock': Config.DEFAULT_SAFETY_STOCK,
        'ordering_cost': Config.ORDERING_COST,
        'holding_cost': Config.HOLDING_COST,
        'lead_time': Config.LEAD_TIME
    }
    result = defaults.copy()

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "SELECT conf_key, conf_value FROM configuration"
            cur.execute(sql)
            rows = cur.fetchall()  # list of dicts
            for row in rows:
                key = row['conf_key']
                val = row['conf_value']
                # map conf_key -> field name
                if key == "DEFAULT_SAFETY_STOCK":
                    result['safety_stock'] = float(val)
                elif key == "ORDERING_COST":
                    result['ordering_cost'] = float(val)
                elif key == "HOLDING_COST":
                    result['holding_cost'] = float(val)
                elif key == "LEAD_TIME":
                    result['lead_time'] = float(val)

    finally:
        conn.close()

    return result

def create_manual_order(supplier_id, product_id, quantity, created_by_user_id=1):
    """
    Tworzy zamówienie do dostawcy (supplier_orders + supplier_order_details).
    - supplier_id: int
    - product_id: int
    - quantity: int
    - created_by_user_id: np. 1 (menadżer)
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # 1. INSERT do supplier_orders
            sql_orders = """
            INSERT INTO supplier_orders (supplier_id, order_date, status, created_by_user_id)
            VALUES (%s, NOW(), 'pending', %s)
            """
            cur.execute(sql_orders, (supplier_id, created_by_user_id))
            order_id = cur.lastrowid  # ID zamówienia

            # 2. INSERT do supplier_order_details
            sql_details = """
            INSERT INTO supplier_order_details (supplier_order_id, product_id, quantity, cost_price)
            VALUES (%s, %s, %s, %s)
            """
            # cost_price = 0.0 (lub inaczej, np. pobrać z bazy)
            cur.execute(sql_details, (order_id, product_id, quantity, 0.0))

        conn.commit()
    finally:
        conn.close()

def get_all_suppliers():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT supplier_id, supplier_name, contact_name, email, phone_number, address, lead_time_days
            FROM suppliers
            ORDER BY supplier_id
            """
            cur.execute(sql)
            return cur.fetchall()  # list of dict
    finally:
        conn.close()

def add_supplier(supplier_name, contact_name, phone, email, comment=None):
    """
    W oryginalnej tabeli `suppliers` nie ma kolumny `comment` - 
    ale w treści pytania była mowa o komentarzu, 
    więc możesz dodać kolumnę `comment` do `suppliers`, lub 
    pominąć ten argument, jeśli nie istnieje w schemacie.
    
    Poniżej zakładam, że `comment` to `address` lub inna kolumna.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            INSERT INTO suppliers (supplier_name, contact_name, email, phone_number, address, lead_time_days)
            VALUES (%s, %s, %s, %s, %s, 0)
            """
            cur.execute(sql, (supplier_name, contact_name, email, phone, comment))
        conn.commit()
    finally:
        conn.close()

def update_supplier(supplier_id, supplier_name, contact_name, phone, email, comment=None):
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            UPDATE suppliers
            SET supplier_name=%s,
                contact_name=%s,
                email=%s,
                phone_number=%s,
                address=%s
            WHERE supplier_id=%s
            """
            cur.execute(sql, (supplier_name, contact_name, email, phone, comment, supplier_id))
        conn.commit()
    finally:
        conn.close()

def delete_supplier(supplier_id):
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "DELETE FROM suppliers WHERE supplier_id=%s"
            cur.execute(sql, (supplier_id,))
        conn.commit()
    finally:
        conn.close()

def get_all_products():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT product_id, product_name, product_desc, sku, price
            FROM products
            ORDER BY product_id
            """
            cur.execute(sql)
            return cur.fetchall()  # list of dict
    finally:
        conn.close()

