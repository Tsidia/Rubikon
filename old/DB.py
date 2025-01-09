import pymysql

# Parametry połączenia z bazą (dostosuj je do własnych)
DB_HOST = 'sql.freedb.tech'     # np. 'your-db-host.com'
DB_USER = 'freedb_rubikon'       # nazwa użytkownika w MySQL
DB_PASS = 'p3h%RnYB9HgeVbe'           # hasło do bazy
DB_NAME = 'freedb_rubikon'            # nazwa bazy danych, którą utworzymy / będziemy używać

def main():
    # Utworzenie połączenia do MySQL (bez wskazania konkretnej bazy),
    # aby móc ją w razie czego utworzyć
    connection = pymysql.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASS,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=True  # Aby CREATE DATABASE zadziałało bez commitowania
    )

    try:
        with connection.cursor() as cursor:
            # 1. Stworzenie bazy danych, jeśli nie istnieje
            create_db_query = f"CREATE DATABASE IF NOT EXISTS {DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
            cursor.execute(create_db_query)
            print(f"[INFO] Baza danych '{DB_NAME}' sprawdzona/utworzona.")

        # 2. Przełączenie się na stworzoną/istniejącą bazę
        connection.select_db(DB_NAME)

        # 3. Stworzenie tabel (najpierw można opcjonalnie usunąć je, jeśli już istnieją)
        drop_tables_if_exist(connection)
        create_tables(connection)

        print("[INFO] Struktura bazy została pomyślnie utworzona!")
    finally:
        connection.close()

def drop_tables_if_exist(connection):
    """
    Funkcja pomocnicza: usuwa tabele w odpowiedniej kolejności (od zależnych do niezależnych),
    jeśli istnieją w bazie. Dzięki temu można ponownie uruchomić skrypt bez błędów.
    """
    with connection.cursor() as cursor:
        # Kolejność: najpierw te, które mają klucze obce do innych
        tables = [
            "customer_order_details",
            "customer_orders",
            "supplier_order_details",
            "supplier_orders",
            "inventory",
            "suppliers",
            "products",
            "users"
        ]
        for tbl in tables:
            cursor.execute(f"DROP TABLE IF EXISTS {tbl}")
            print(f"[INFO] Tabela '{tbl}' usunięta (jeśli istniała).")

def create_tables(connection):
    """
    Funkcja tworząca poszczególne tabele w wymaganej kolejności.
    """
    with connection.cursor() as cursor:
        # Tabela users
        # Nie potrzebujemy osobnej tabeli ról, więc dajemy role_name w users.
        create_users = """
        CREATE TABLE IF NOT EXISTS users (
            user_id INT AUTO_INCREMENT PRIMARY KEY,
            email VARCHAR(100) NOT NULL UNIQUE,        -- email = username
            password_hash VARCHAR(255) NOT NULL,
            role_name VARCHAR(50) NOT NULL,           -- np. 'manager', 'magazynier', 'sprzedawca', 'ksiegowy', 'customer'
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_users)
        print("[INFO] Tabela 'users' utworzona.")

        # Tabela products
        create_products = """
        CREATE TABLE IF NOT EXISTS products (
            product_id INT AUTO_INCREMENT PRIMARY KEY,
            product_name VARCHAR(100) NOT NULL,
            product_desc TEXT,
            sku VARCHAR(50) NOT NULL UNIQUE,
            price DECIMAL(10,2) NOT NULL,
            created_at DATETIME NOT NULL,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_products)
        print("[INFO] Tabela 'products' utworzona.")

        # Tabela inventory (PK = product_id)
        create_inventory = """
        CREATE TABLE IF NOT EXISTS inventory (
            product_id INT NOT NULL,
            quantity_in_stock INT NOT NULL DEFAULT 0,
            reorder_level INT NOT NULL DEFAULT 0,
            reorder_qty INT NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (product_id),
            CONSTRAINT fk_inventory_product
                FOREIGN KEY (product_id) REFERENCES products(product_id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_inventory)
        print("[INFO] Tabela 'inventory' utworzona.")

        # Tabela suppliers
        create_suppliers = """
        CREATE TABLE IF NOT EXISTS suppliers (
            supplier_id INT AUTO_INCREMENT PRIMARY KEY,
            supplier_name VARCHAR(100) NOT NULL,
            contact_name VARCHAR(100),
            email VARCHAR(100),
            phone_number VARCHAR(20),
            address VARCHAR(255),
            lead_time_days INT DEFAULT 0
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_suppliers)
        print("[INFO] Tabela 'suppliers' utworzona.")

        # Tabela supplier_orders
        create_supplier_orders = """
        CREATE TABLE IF NOT EXISTS supplier_orders (
            supplier_order_id INT AUTO_INCREMENT PRIMARY KEY,
            supplier_id INT NOT NULL,
            order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            expected_delivery_date TIMESTAMP,
            received_date TIMESTAMP,
            status VARCHAR(20) DEFAULT 'pending',
            created_by_user_id INT NOT NULL,
            CONSTRAINT fk_supplier_orders_supplier
                FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
                ON DELETE RESTRICT
                ON UPDATE CASCADE,
            CONSTRAINT fk_supplier_orders_user
                FOREIGN KEY (created_by_user_id) REFERENCES users(user_id)
                ON DELETE RESTRICT
                ON UPDATE CASCADE
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_supplier_orders)
        print("[INFO] Tabela 'supplier_orders' utworzona.")

        # Tabela supplier_order_details
        create_supplier_order_details = """
        CREATE TABLE IF NOT EXISTS supplier_order_details (
            supplier_order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
            supplier_order_id INT NOT NULL,
            product_id INT NOT NULL,
            quantity INT NOT NULL,
            cost_price DECIMAL(10,2) DEFAULT 0.00,
            CONSTRAINT fk_so_details_supplier_order
                FOREIGN KEY (supplier_order_id) REFERENCES supplier_orders(supplier_order_id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
            CONSTRAINT fk_so_details_product
                FOREIGN KEY (product_id) REFERENCES products(product_id)
                ON DELETE RESTRICT
                ON UPDATE CASCADE
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_supplier_order_details)
        print("[INFO] Tabela 'supplier_order_details' utworzona.")

        # Tabela customer_orders
        create_customer_orders = """
        CREATE TABLE IF NOT EXISTS customer_orders (
            order_id INT AUTO_INCREMENT PRIMARY KEY,
            user_id INT NOT NULL,   -- klient (lub user z rolą 'customer')
            order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            shipping_address VARCHAR(255),
            status VARCHAR(20) DEFAULT 'new',
            total_amount DECIMAL(10,2) DEFAULT 0.00,
            payment_status VARCHAR(20) DEFAULT 'pending',
            CONSTRAINT fk_customer_orders_user
                FOREIGN KEY (user_id) REFERENCES users(user_id)
                ON DELETE RESTRICT
                ON UPDATE CASCADE
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_customer_orders)
        print("[INFO] Tabela 'customer_orders' utworzona.")

        # Tabela customer_order_details
        create_customer_order_details = """
        CREATE TABLE IF NOT EXISTS customer_order_details (
            order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
            order_id INT NOT NULL,
            product_id INT NOT NULL,
            quantity INT NOT NULL,
            unit_price DECIMAL(10,2) NOT NULL,
            CONSTRAINT fk_co_details_order
                FOREIGN KEY (order_id) REFERENCES customer_orders(order_id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
            CONSTRAINT fk_co_details_product
                FOREIGN KEY (product_id) REFERENCES products(product_id)
                ON DELETE RESTRICT
                ON UPDATE CASCADE
        ) ENGINE=InnoDB;
        """
        cursor.execute(create_customer_order_details)
        print("[INFO] Tabela 'customer_order_details' utworzona.")

        connection.commit()

if __name__ == "__main__":
    main()
