# sales.py
import datetime
from services import get_connection

def get_sales_data_for_product(product_id):
    """
    Zwraca listę (sale_date, quantity_sum) posortowaną rosnąco po dacie. 
    Ograniczamy się do ostatniego roku
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # Dajemy 365 dni wstecz od dzisiaj
            one_year_ago = (datetime.date.today() - datetime.timedelta(days=365)).strftime('%Y-%m-%d')
            
            sql = """
            SELECT 
                DATE(co.order_date) AS sale_date,
                SUM(cod.quantity) AS quantity_sum
            FROM customer_orders co
            JOIN customer_order_details cod ON co.order_id = cod.order_id
            WHERE cod.product_id = %s
              AND co.order_date >= %s
              AND co.status IN ('completed')
            GROUP BY DATE(co.order_date)
            ORDER BY DATE(co.order_date)
            """
            cur.execute(sql, (product_id, one_year_ago))
            rows = cur.fetchall()  # list of dict, e.g. [{'sale_date': datetime.date(...), 'quantity_sum': 12}, ...]
            
            # Zamieniamy sale_date na str
            result = []
            for r in rows:
                d = r['sale_date']
                if isinstance(d, datetime.date):
                    d_str = d.strftime('%Y-%m-%d')
                else:
                    d_str = str(d)
                result.append({
                    'sale_date': d_str,
                    'quantity_sum': r['quantity_sum']
                })
            return result
    finally:
        conn.close()

def get_weighted_demand(product_id, days=30):
    """
    Oblicza średnią ważoną dziennej sprzedaży produktu w ostatnich n dniach.
    Najstarszy dzień ma wagę=1, nowsze mają większe wagi.
    Zwraca float.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # Ostatnie X dni
            today = datetime.date.today()
            start_date = today - datetime.timedelta(days=days)
            start_str = start_date.strftime('%Y-%m-%d')

            sql = """
            SELECT DATE(co.order_date) AS sale_day,
                   SUM(cod.quantity) AS total_sold
            FROM customer_orders co
            JOIN customer_order_details cod
                 ON co.order_id = cod.order_id
            WHERE cod.product_id = %s
              AND co.order_date >= %s
              AND co.status IN ('completed')
            GROUP BY DATE(co.order_date)
            ORDER BY sale_day ASC
            """
            cur.execute(sql, (product_id, start_str))
            rows = cur.fetchall()  # np. [{'sale_day': datetime.date(...), 'total_sold': 12}, ...]

        # przypisz wagi
        if not rows:
            return 0.0

        total_weighted_sales = 0.0
        total_weight = 0.0
        # i = 0..(len(rows)-1)
        for i, row in enumerate(rows):
            sold = row['total_sold'] or 0
            weight = i+1  # najstarszy day ma wagę 1, kolejne rosną
            total_weighted_sales += float(sold) * weight
            total_weight += weight

        if total_weight == 0:
            return 0.0

        avg_weighted = total_weighted_sales / total_weight
        return avg_weighted
    finally:
        conn.close()
