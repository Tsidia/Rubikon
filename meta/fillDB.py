import random
import datetime

def generate_sql_orders(filename="generated_orders.sql"):
    """
    Generuje dane w postaci poleceń INSERT INTO ... 
    i zapisuje w pliku .sql.
    """

    # Ustawienia
    start_date = datetime.date(2024, 1, 1)  # początek
    num_days = 365

    # Ceny produktów (product_id -> price)
    product_prices = {
        1: 29.99,  # mała kostka
        2: 39.99,  # średnia
        3: 49.99   # duża
    }

    # Parametry popytu
    # Produkt 1: stała średnia ~10, +/-5
    # Produkt 2: stała ~5, co 30 dni skok
    # Produkt 3: stała ~8, w ostatnim miesiącu (dni od 335 do 365) anomalia +20
    avg1 = 10
    avg2 = 5
    avg3 = 8

    lines = []
    lines.append("-- SQL Insert statements for customer_orders and customer_order_details\n")
    lines.append("SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';\n")
    lines.append("START TRANSACTION;\n")

    # Auto-increment w bazie uzupełni order_id i order_detail_id
    order_count = 0
    detail_count = 0

    # Będziemy generować: 1 zamówienie na każdy dzień -> 1 wiersz w customer_orders
    # i do 3 wierszy w customer_order_details (zależnie od popytu).
    current_date = start_date

    for d in range(num_days):
        order_date = current_date.strftime("%Y-%m-%d 10:00:00")  # powiedzmy 10:00

        # Symulacja popytu:
        # 1) produkt_id=1
        demand1 = max(0, int(random.gauss(avg1, 3)))  # normal(10,3)
        # 2) produkt_id=2, co 30 dni skok np. +10
        base2 = avg2 + (10 if (d % 30 == 0 and d>0) else 0)
        demand2 = max(0, int(random.gauss(base2, 2)))
        # 3) produkt_id=3, w ostatnim miesiącu (dni>=335) anomalia +20
        is_anomaly = (d >= (num_days - 30))  # ostatnie 30 dni
        base3 = avg3 + (20 if is_anomaly else 0)
        demand3 = max(0, int(random.gauss(base3, 4)))

        # Zliczamy łącznie, czy w tym dniu w ogóle były zakupy
        demands = {
            1: demand1,
            2: demand2,
            3: demand3
        }
        # Filtrujemy te, które > 0
        demanded_products = [(pid, qty) for pid, qty in demands.items() if qty>0]
        if not demanded_products:
            # Brak popytu w tym dniu => brak zamówienia => nic wstawiamy
            current_date += datetime.timedelta(days=1)
            continue

        # Mamy co najmniej 1 produkt => generujemy zamówienie
        # shipping_address: prosty generator
        street_num = random.randint(1,999)
        shipping_addr = f"Street {street_num}, City {d}X"

        # policzymy total_amount
        total_amount = 0.0
        for (pid, qty) in demanded_products:
            price = product_prices.get(pid, 0)
            total_amount += (price * qty)

        # Dodajemy wiersz do customer_orders
        # Używamy "NULL" w polu order_id, bo auto_increment się tym zajmie
        # user_id= NULL => gościnne
        # status='completed', payment_status='paid'
        insert_order = (f"INSERT INTO customer_orders "
                        f"(order_id, user_id, order_date, shipping_address, status, total_amount, payment_status)"
                        f" VALUES (NULL, NULL, '{order_date}', '{shipping_addr}', 'completed', {total_amount:.2f}, 'paid');")

        lines.append(insert_order + "\n")
        # Czekamy z detailami do momentu, gdy poznamy last_insert_id()
        lines.append("SET @order_id = LAST_INSERT_ID();\n")

        # Tworzymy wiersze w customer_order_details
        for (pid, qty) in demanded_products:
            price = product_prices[pid]
            # unit_price = price
            insert_detail = (f"INSERT INTO customer_order_details "
                             f"(order_detail_id, order_id, product_id, quantity, unit_price)"
                             f" VALUES (NULL, @order_id, {pid}, {qty}, {price});")
            lines.append(insert_detail + "\n")

        # Koniec 1 zamówienia
        lines.append("\n")

        current_date += datetime.timedelta(days=1)

    # Koniec transakcji
    lines.append("COMMIT;\n")

    # Zapis do pliku
    with open(filename, "w", encoding="utf-8") as f:
        f.writelines(lines)

    print(f"[INFO] Wygenerowano plik {filename}")

if __name__ == "__main__":
    generate_sql_orders("generated_orders.sql")
