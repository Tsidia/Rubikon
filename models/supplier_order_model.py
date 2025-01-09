# models/supplier_order_model.py
import pymysql
from models.user_model import get_connection

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
