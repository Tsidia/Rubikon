import pymysql
import datetime

DB_HOST = 'sql.freedb.tech'     # np. 'your-db-host.com'
DB_USER = 'freedb_rubikon'       # nazwa użytkownika w MySQL
DB_PASS = 'p3h%RnYB9HgeVbe'           # hasło do bazy
DB_NAME = 'freedb_rubikon'            # nazwa bazy danych, którą utworzymy / będziemy używać

def main():
    # Połączenie z bazą
    connection = pymysql.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASS,
        database=DB_NAME,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=False  # transakcyjnie
    )

    try:
        with connection.cursor() as cursor:
            # Wstawiamy dane przykładowe
            insert_sample_data(cursor)

        # Jeśli wszystko się uda — zatwierdź transakcję
        connection.commit()
        print("[INFO] Pomyślnie dodano przykładowe dane do bazy.")

    except Exception as e:
        # Przy błędzie cofamy transakcję
        connection.rollback()
        print(f"[ERROR] Wystąpił błąd podczas wstawiania danych: {e}")
    finally:
        connection.close()


def insert_sample_data(cursor):
    """
    Funkcja wstawiająca przykładowe dane do bazy.
    Zakładamy, że tabele zostały już utworzone.
    """

    # --------------------------------------------
    # 1. UŻYTKOWNICY
    # --------------------------------------------
    # Przyjmijmy stałe ID, żeby łatwo było odwoływać się dalej:
    # user_id 1: manager
    # user_id 2: magazynier
    # user_id 3: sprzedawca
    # user_id 4: ksiegowy
    # user_id 5: customer
    # Hasła wpisane tutaj "na żywo" — w realnym projekcie powinny być zahaszowane.
    # created_at (DATETIME) — wstawimy bieżącą datę/czas w Pythonie.
    now_str = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    sql_users = """
    INSERT INTO users 
        (user_id, email, password_hash, role_name, first_name, last_name, created_at)
    VALUES
        (1, 'manager@rubikon.com',   'manager123', 'manager',     'Alice', 'Manager',    %s),
        (2, 'warehouse@rubikon.com', 'warehouse',  'magazynier',  'Bob',   'Warehouse',  %s),
        (3, 'seller@rubikon.com',    'seller',     'sprzedawca',  'Charlie','Seller',   %s),
        (4, 'accountant@rubikon.com','accountant', 'ksiegowy',    'Dana',  'Accountant', %s),
        (5, 'customer@rubikon.com',  'customer',   'customer',    'Eve',   'Customer',   %s)
    """
    cursor.execute(sql_users, (now_str, now_str, now_str, now_str, now_str))

    # --------------------------------------------
    # 2. DOSTAWCY
    # --------------------------------------------
    # supplier_id 1,2
    sql_suppliers = """
    INSERT INTO suppliers 
        (supplier_id, supplier_name, contact_name, email, phone_number, address, lead_time_days)
    VALUES
        (1, 'Rubikon Supplier 1', 'John Doe', 'supplier1@rubikon.com', '123456789', 'Supplier Street 1', 7),
        (2, 'Rubikon Supplier 2', 'Jane Smith', 'supplier2@rubikon.com', '987654321', 'Supplier Street 2', 10)
    """
    cursor.execute(sql_suppliers)

    # --------------------------------------------
    # 3. PRODUKTY
    # --------------------------------------------
    # product_id 1,2,3
    # created_at => datetime, updated_at => TIMESTAMP (może wymagać inaczej, w zależności od definicji)
    # wstawiamy updated_at zwykłym UPDATE, bo TIMESTAMP z ON UPDATE ustawi się też automatycznie 
    # (lub wstawiamy default if needed).
    sql_products = """
    INSERT INTO products
        (product_id, product_name, product_desc, sku, price, created_at)
    VALUES
        (1, 'Kostka Rubika 2x2', 'Mała kostka 2x2', 'RB2X2', 29.99, %s),
        (2, 'Kostka Rubika 3x3', 'Klasyczna kostka 3x3', 'RB3X3', 39.99, %s),
        (3, 'Kostka Rubika 4x4', 'Większa kostka 4x4', 'RB4X4', 49.99, %s)
    """
    cursor.execute(sql_products, (now_str, now_str, now_str))

    # --------------------------------------------
    # 4. STANY MAGAZYNOWE
    # --------------------------------------------
    # inventory: PK = product_id
    # Zakładamy, że nasz sklep ma na starcie jakieś ilości tych kostek.
    sql_inventory = """
    INSERT INTO inventory
        (product_id, quantity_in_stock, reorder_level, reorder_qty)
    VALUES
        (1, 20,  5,  10),   -- Kostka 2x2
        (2, 30, 10, 20),    -- Kostka 3x3
        (3, 15,  5, 15)     -- Kostka 4x4
    """
    cursor.execute(sql_inventory)

    # --------------------------------------------
    # 5. ZAMÓWIENIA DO DOSTAWCÓW
    # --------------------------------------------
    # supplier_order_id 1 => złożone do supplier_id=1 przez user_id=1 (manager)
    # Załóżmy, że już dostarczone
    sql_supplier_orders = """
    INSERT INTO supplier_orders
        (supplier_order_id, supplier_id, order_date, expected_delivery_date, received_date, status, created_by_user_id)
    VALUES
        (1, 1, %s, %s, %s, 'delivered', 1),
        (2, 2, %s, %s, NULL, 'pending', 1)
    """
    # Zakładamy order_date = now, expected_delivery_date 5 dni później, received_date = dzisiaj 
    # (dla zamówienia 1) i brak received_date (dla zamówienia 2).
    now = datetime.datetime.now()
    order_date_1 = now.strftime('%Y-%m-%d %H:%M:%S')
    expected_date_1 = (now + datetime.timedelta(days=5)).strftime('%Y-%m-%d %H:%M:%S')
    received_date_1 = now.strftime('%Y-%m-%d %H:%M:%S')

    # Dla drugiego zamówienia 
    order_date_2 = now.strftime('%Y-%m-%d %H:%M:%S')
    expected_date_2 = (now + datetime.timedelta(days=10)).strftime('%Y-%m-%d %H:%M:%S')
    received_date_2 = None  # bo pending

    cursor.execute(sql_supplier_orders, (
        order_date_1, expected_date_1, received_date_1,
        order_date_2, expected_date_2
    ))

    # --------------------------------------------
    # 6. SZCZEGÓŁY ZAMÓWIEŃ DO DOSTAWCÓW
    # --------------------------------------------
    # supplier_order_detail_id 1 => dot. supplier_order_id=1 (pierwsze zamówienie)
    # Zamawiamy np. 10 szt. produktu 1 i 5 szt. produktu 2
    sql_supplier_order_details = """
    INSERT INTO supplier_order_details
        (supplier_order_detail_id, supplier_order_id, product_id, quantity, cost_price)
    VALUES
        (1, 1, 1, 10, 15.00),   -- 10 szt. kostki 2x2
        (2, 1, 2,  5, 25.00),   -- 5 szt. kostki 3x3
        (3, 2, 3,  8, 30.00)    -- 8 szt. kostki 4x4 (w zamówieniu 2, jeszcze nie otrzymano)
    """
    cursor.execute(sql_supplier_order_details)

    # --------------------------------------------
    # 7. ZAMÓWIENIA KLIENTÓW
    # --------------------------------------------
    # customer_orders: user_id=5 to 'customer@rubikon.com'
    # Zakładamy order_id=1
    # status = 'new', total_amount np. 79.98, payment_status='pending'
    shipping_address = "ul. Główna 1, 00-001 Miasto"
    sql_customer_orders = """
    INSERT INTO customer_orders
        (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status)
    VALUES
        (1, 5, %s, %s, 'new', 79.98, 'pending')
    """
    now_str2 = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    cursor.execute(sql_customer_orders, (now_str2, shipping_address))

    # --------------------------------------------
    # 8. SZCZEGÓŁY ZAMÓWIEŃ KLIENTÓW
    # --------------------------------------------
    # customer_order_details: order_detail_id=1 => order_id=1
    # Zamówmy 2 szt. kostki 3x3 (product_id=2) po 39.99 za sztukę => 79.98
    sql_customer_order_details = """
    INSERT INTO customer_order_details
        (order_detail_id, order_id, product_id, quantity, unit_price)
    VALUES
        (1, 1, 2, 2, 39.99)
    """
    cursor.execute(sql_customer_order_details)

    print("[INFO] Wstawiono przykładowe dane.")


if __name__ == "__main__":
    main()
