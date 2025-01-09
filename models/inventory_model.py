# models/inventory_model.py
import pymysql
from models.user_model import get_connection
def get_all_inventory():
    """
    Zwraca listę (product_id, product_name, quantity_in_stock, itp.)
    """
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            sql = """
            SELECT p.product_id, p.product_name, i.quantity_in_stock
            FROM products p
            JOIN inventory i ON p.product_id = i.product_id
            """
            cursor.execute(sql)
            return cursor.fetchall()
    finally:
        conn.close()

def update_inventory_quantity(product_id, new_quantity):
    """
    Ustawia wprost quantity_in_stock = new_quantity
    w tabeli inventory dla danego product_id.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            sql = """
            UPDATE inventory 
            SET quantity_in_stock = %s
            WHERE product_id = %s
            """
            cursor.execute(sql, (new_quantity, product_id))
        conn.commit()
    finally:
        conn.close()
