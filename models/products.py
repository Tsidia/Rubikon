# products.py
import datetime
from services import get_connection

def get_all_products():
    """
    Zwraca listę wszystkich produktów w postaci listy słowników:
      [
        {
          'product_id': 1,
          'product_name': 'Kostka Rubika 2x2',
          'product_desc': 'Mała kostka 2x2',
          'sku': 'RB2X2',
          'price': 29.99,
          'created_at': datetime('...'),
          'updated_at': datetime('...')
        },
        ...
      ]
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT 
                product_id,
                product_name,
                product_desc,
                sku,
                price,
                created_at,
                updated_at
            FROM products
            ORDER BY product_id
            """
            cur.execute(sql)
            rows = cur.fetchall()  # list of dict
            return rows
    finally:
        conn.close()

def get_product_by_id(product_id):
    """
    Zwraca szczegółowe dane o jednym produkcie (słownik)
    lub None, jeśli nie istnieje produkt o podanym ID.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT 
                product_id,
                product_name,
                product_desc,
                sku,
                price,
                created_at,
                updated_at
            FROM products
            WHERE product_id = %s
            """
            cur.execute(sql, (product_id,))
            row = cur.fetchone()  # dict lub None
            return row
    finally:
        conn.close()

def add_product(product_name, product_desc, sku, price):
    """
    Funkcja do dodawania nowego produktu
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            INSERT INTO products
              (product_name, product_desc, sku, price, created_at)
            VALUES (%s, %s, %s, %s, NOW())
            """
            cur.execute(sql, (product_name, product_desc, sku, price))
        conn.commit()
    finally:
        conn.close()

def update_product(product_id, product_name, product_desc, sku, price):
    """
    Funkcja do edycji produktu
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            UPDATE products
            SET product_name = %s,
                product_desc = %s,
                sku = %s,
                price = %s,
                updated_at = NOW()
            WHERE product_id = %s
            """
            cur.execute(sql, (product_name, product_desc, sku, price, product_id))
        conn.commit()
    finally:
        conn.close()

def delete_product(product_id):
    """
    Funkcja do usunięcia produktu uwaga na klucze obce nie usuwaj produktu na który są aktualne zamówienia
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "DELETE FROM products WHERE product_id=%s"
            cur.execute(sql, (product_id,))
        conn.commit()
    finally:
        conn.close()
def get_inventory_for_product(product_id):
    """
    Zwraca np. {'product_id': X, 'quantity_in_stock': Y} 
    lub None jeśli brak wpisu w inventory.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT product_id, quantity_in_stock
            FROM inventory
            WHERE product_id=%s
            """
            cur.execute(sql, (product_id,))
            row = cur.fetchone()
            if row:
                return {'product_id': row['product_id'],
                        'quantity_in_stock': row['quantity_in_stock']}
            else:
                return {'product_id': product_id, 'quantity_in_stock': 0}
    finally:
        conn.close()

def get_in_transit_for_product(product_id):
    """
    Sumuje ilości w supplier_order_details
    gdzie product_id = X
    i supplier_orders.status in ('pending','shipped') => jeszcze niedostarczone
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT SUM(sod.quantity) as total_in_transit
            FROM supplier_order_details sod
            JOIN supplier_orders so ON so.supplier_order_id = sod.supplier_order_id
            WHERE sod.product_id=%s
              AND so.status IN ('pending','shipped')
            """
            cur.execute(sql, (product_id,))
            row = cur.fetchone()
            if row and row['total_in_transit']:
                return row['total_in_transit']
            else:
                return 0
    finally:
        conn.close()
