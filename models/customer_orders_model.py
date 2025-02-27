# customer_orders_model.py

from services import get_connection
import datetime


def get_pending_shippings():
    """
    Zwraca listę zamówień klientów, które mają status 'pending').
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT 
                order_id AS customer_order_id,
                order_date,
                shipping_address,
                status,
                '' AS customer_name  -- lub JOIN z users lub przechowywanie w polu
            FROM customer_orders
            WHERE status IN ('new', 'pending' 'pending_shipping')
            ORDER BY order_date ASC
            """
            cur.execute(sql)
            rows = cur.fetchall()  # list[dict]
            return rows
    finally:
        conn.close()


def get_customer_order(order_id):
    """
    Zwraca dict z informacjami o zamówieniu klienta (po order_id), lub None, jeśli nie znaleziono.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT
                order_id AS customer_order_id,
                order_date,
                shipping_address,
                status,
                '' AS customer_name
            FROM customer_orders
            WHERE order_id = %s
            """
            cur.execute(sql, (order_id,))
            row = cur.fetchone()
            return row
    finally:
        conn.close()


def confirm_customer_shipping(order_id):
    """
    Ustawia status zamówienia na 'shipped'
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql_update = """
            UPDATE customer_orders
            SET status='shipped'
            WHERE order_id=%s
            """
            cur.execute(sql_update, (order_id,))

        conn.commit()
    finally:
        conn.close()

def place_order_for_customer(user_id, cart, shipping_address):
    """
    Tworzy zamówienie w customer_orders i customer_order_details
    cart to dict: { '1': 2, '3': 1 } => product_id: quantity
    Oblicza total_amount w oparciu o PRICE_MAP
    Zwraca order_id (int).
    """
        
    # Cennik dla uproszczenia
    PRICE_MAP = {
        1: 29.99,  # mała
        2: 39.99,  # średnia
        3: 49.99   # duża
        }
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # 1) Najpierw oblicz sumę
            total_amount = 0.0
            for pid_str, qty in cart.items():
                pid = int(pid_str)
                quantity = int(qty)
                price = PRICE_MAP.get(pid, 0.0)  # domyślnie 0.0 jeśli nie mamy w mapie
                total_amount += price * quantity

            # 2) INSERT do customer_orders
            sql_order = """
            INSERT INTO customer_orders 
               (user_id, order_date, shipping_address, status, total_amount, payment_status)
            VALUES 
               (%s, NOW(), %s, 'new', %s, 'pending')
            """
            cur.execute(sql_order, (user_id, shipping_address, total_amount))
            order_id = cur.lastrowid

            # 3) Wstawmy szczegóły do customer_order_details jednocześnie uwzględniamy cenę z PRICE_MAP
            for pid_str, qty in cart.items():
                pid = int(pid_str)
                quantity = int(qty)
                unit_price = PRICE_MAP.get(pid, 0.0)

                sql_detail = """
                INSERT INTO customer_order_details 
                  (order_id, product_id, quantity, unit_price)
                VALUES 
                  (%s, %s, %s, %s)
                """
                cur.execute(sql_detail, (order_id, pid, quantity, unit_price))

        conn.commit()
        return order_id
    finally:
        conn.close()

def get_orders_for_accounting(filter_status=''):
    """
    Zwraca listę zamówień (dict) z polami:
      order_id, order_date, total_amount, payment_status, shipping_address, ...
    Jeśli filter_status to filtruje po payment_status = filter_status
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            if filter_status:
                sql = """
                SELECT 
                  order_id,
                  user_id,
                  order_date,
                  shipping_address,
                  status,
                  total_amount,
                  payment_status
                FROM customer_orders
                WHERE payment_status = %s
                ORDER BY order_date DESC
                """
                cur.execute(sql, (filter_status,))
            else:
                sql = """
                SELECT 
                  order_id,
                  user_id,
                  order_date,
                  shipping_address,
                  status,
                  total_amount,
                  payment_status
                FROM customer_orders
                ORDER BY order_date DESC
                """
                cur.execute(sql)

            rows = cur.fetchall()
            return rows
    finally:
        conn.close()

def update_payment_status(order_id, new_status):
    """
    Ustawia payment_status = new_status w customer_orders dla order_id.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            UPDATE customer_orders
            SET payment_status = %s
            WHERE order_id = %s
            """
            cur.execute(sql, (new_status, order_id))
        conn.commit()
    finally:
        conn.close()

def get_payment_status_counts():
    """
    Zwraca słownik np. { 'pending': 5, 'paid': 12, 'refunded': 2, ... }
    zliczając liczbę zamówień w każdym payment_status.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT payment_status, COUNT(*) as count
            FROM customer_orders
            GROUP BY payment_status
            """
            cur.execute(sql)
            rows = cur.fetchall()  # np. [{'payment_status':'pending','count':5}, ...]
            
            result = {}
            for r in rows:
                ps = r['payment_status']
                c = r['count']
                result[ps] = c
            return result
    finally:
        conn.close()

def get_customer_receivables():
    """
    Zwraca:
      - listę dictów: [ {order_id, total_amount, payment_status, ...}, ... ]
      - sumaryczną kwotę (float) należności
    """
    conn = get_connection()
    orders = []
    total_receivables = 0.0
    try:
        with conn.cursor() as cur:
            # Payment_status='pending' oznacza nieopłacone
            sql = """
            SELECT order_id, total_amount, payment_status, shipping_address
            FROM customer_orders
            WHERE payment_status='pending'
            """
            cur.execute(sql)
            rows = cur.fetchall()
            for r in rows:
                orders.append(r)
                total_receivables += float(r['total_amount'])
    finally:
        conn.close()

    return (orders, total_receivables)

def get_supplier_payables():
    """
    Zwraca:
      - listę dictów: [ {supplier_order_id, total_cost, payment_status, ...}, ...]
      - sumaryczną kwotę (float) zadłużeń (payables)
    """
    conn = get_connection()
    orders = []
    total_payables = 0.0
    try:
        with conn.cursor() as cur:
            # payment_status='unpaid' => jeszcze nie zapłaciliśmy dostawcy
            # 1) Znajdź supplier_orders
            sql = """
            SELECT supplier_order_id
            FROM supplier_orders
            WHERE payment_status='unpaid'
            """
            cur.execute(sql)
            rows = cur.fetchall()
            # dla każdego supplier_order policz cost
            for row in rows:
                so_id = row['supplier_order_id']
                
                # sumujemy cost_price * quantity z supplier_order_details
                sql_details = """
                SELECT SUM(cost_price * quantity) as total_cost
                FROM supplier_order_details
                WHERE supplier_order_id=%s
                """
                cur.execute(sql_details, (so_id,))
                detail_row = cur.fetchone()
                total_cost = float(detail_row['total_cost']) if detail_row['total_cost'] else 0.0

                orders.append({
                    'supplier_order_id': so_id,
                    'total_cost': total_cost,
                    'payment_status': 'unpaid'
                })
                total_payables += total_cost

    finally:
        conn.close()

    return (orders, total_payables)

def get_total_revenue():
    """
    Suma przychodów = SUM(order_details.quantity * order_details.unit_price)
    ze wszystkich customer_order_details, 
    filtr statusu 'paid'
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT SUM(cod.quantity * cod.unit_price) AS revenue
            FROM customer_order_details cod
            JOIN customer_orders co ON co.order_id = cod.order_id
            WHERE co.payment_status = 'paid'
            """
            cur.execute(sql)
            row = cur.fetchone()
            revenue = row['revenue'] if row['revenue'] else 0.0
            return revenue
    finally:
        conn.close()


def get_total_cost():
    """
    Suma kosztów = SUM(sod.quantity * sod.cost_price)
    ze wszystkich supplier_order_details,
    filtr statusu 'delivered'
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT SUM(sod.quantity * sod.cost_price) AS cost
            FROM supplier_order_details sod
            JOIN supplier_orders so ON so.supplier_order_id = sod.supplier_order_id
            WHERE so.status = 'delivered'
            """
            cur.execute(sql)
            row = cur.fetchone()
            cost = row['cost'] if row['cost'] else 0.0
            return cost
    finally:
        conn.close()

def get_daily_revenue_cost(start_date=None, end_date=None):
    """
    Zwraca listę słowników: [
      { 'report_date': 'YYYY-MM-DD', 'revenue': 123.45, 'cost': 67.89 },
      ...
    ]
    Pogrupowane według daty (dzień). 
    Ograniczone do [start_date, end_date] jeżeli podane.
    - revenue = sum(customer_order_details) z payment_status='paid'
    - cost = sum(supplier_order_details) z status='delivered'
    """

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            revenue_sql = """
            SELECT DATE(co.order_date) as report_date,
                   SUM(cod.quantity * cod.unit_price) as total_revenue
            FROM customer_order_details cod
            JOIN customer_orders co ON co.order_id = cod.order_id
            WHERE co.payment_status = 'paid'
            {date_filter}
            GROUP BY DATE(co.order_date)
            """

            cost_sql = """
            SELECT DATE(so.order_date) as report_date,
                   SUM(sod.quantity * sod.cost_price) as total_cost
            FROM supplier_order_details sod
            JOIN supplier_orders so ON so.supplier_order_id = sod.supplier_order_id
            WHERE so.status = 'delivered'
            {date_filter}
            GROUP BY DATE(so.order_date)
            """

            # date_filter dynamiczny
            date_condition = ""
            params = []
            if start_date and end_date:
                revenue_date_condition = "AND co.order_date BETWEEN %s AND %s"
                cost_date_condition    = "AND so.order_date BETWEEN %s AND %s"
                revenue_sql = revenue_sql.replace("{date_filter}", revenue_date_condition)
                cost_sql    = cost_sql.replace("{date_filter}", cost_date_condition)
            else:
                revenue_sql = revenue_sql.replace("{date_filter}", "")
                cost_sql    = cost_sql.replace("{date_filter}", "")
                # Podmienimy w revenue_sql i cost_sql, ale w cost_sql 
                # musimy nazwy kolumn i aliasy dopasować:
            
            # trik: 
            revenue_sql = revenue_sql.replace("{date_filter}", date_condition.replace("co.", "co."))
            cost_sql    = cost_sql.replace("{date_filter}", date_condition.replace("so.", "so."))

            if start_date and end_date:
                cur.execute(revenue_sql, (start_date, end_date))
                rev_rows = cur.fetchall()
                cur.execute(cost_sql, (start_date, end_date))
                cost_rows = cur.fetchall()
            else:
                cur.execute(revenue_sql)
                rev_rows = cur.fetchall()
                cur.execute(cost_sql)
                cost_rows = cur.fetchall()

            # Teraz łączymy te dane w jeden słownik
            # klucz = report_date (str 'YYYY-MM-DD')
            data_map = {}

            for r in rev_rows:
                rd = r['report_date'].strftime("%Y-%m-%d")
                revenue = r['total_revenue'] if r['total_revenue'] else 0.0
                if rd not in data_map:
                    data_map[rd] = {'revenue': revenue, 'cost': 0.0}
                else:
                    data_map[rd]['revenue'] = revenue

            for c in cost_rows:
                cd = c['report_date'].strftime("%Y-%m-%d")
                cost = c['total_cost'] if c['total_cost'] else 0.0
                if cd not in data_map:
                    data_map[cd] = {'revenue': 0.0, 'cost': cost}
                else:
                    data_map[cd]['cost'] = cost

            # Teraz konwertujemy data_map w listę posortowaną po dacie
            results = []
            for date_str, vals in data_map.items():
                results.append({
                    'report_date': date_str,
                    'revenue': vals['revenue'],
                    'cost': vals['cost']
                })

            # posortuj rosnąco po dacie
            results.sort(key=lambda x: x['report_date'])
            return results
    finally:
        conn.close()        