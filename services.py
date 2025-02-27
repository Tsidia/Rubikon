# services.py
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
        autocommit=False  # transakcyjność
    )
    
def save_multiple_config(data_dict):
    """
    data_dict jest słownikiem: { 'H_COST': '2.0', 'ORDERING_COST': '50', ... }
    Wstawiamy do 'configuration' klucz->wartość 
    w pętli ON DUPLICATE KEY UPDATE.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            for k, v in data_dict.items():
                sql = """
                INSERT INTO configuration (conf_key, conf_value)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE conf_value=VALUES(conf_value)
                """
                cur.execute(sql, (k, v))
        conn.commit()
    finally:
        conn.close()
    

def load_config():
    """
    Wczytuje parametry z tabeli 'configuration' w bazie danych.
    Jeśli brak klucza, korzysta z Config.* (domyślnych).
    Zwraca dict:
      {
        'h_cost': float,
        'ordering_cost': float,
        'safety_stock': float,
        'lead_time': float,
        'days_range': int,
        'auto_run_interval': int
      }
    """
    result = { # Fallback
      'h_cost': Config.HOLDING_COST,         # roczny koszt magazynowania
      'ordering_cost': Config.ORDERING_COST, # koszt pojedynczego zamówienia
      'safety_stock': Config.DEFAULT_SAFETY_STOCK, # zapas bezpieczeństwa
      'lead_time': Config.LEAD_TIME, # Najkrótszy czas dostawy
      'days_range': Config.DAYS_RANGE, # Ile ostatnich dni uwzględnić w algorytmie ROP EOQ
      'auto_run_interval': Config.AUTO_RUN_INTERVAL # Jak często uruchamiać algorytm w minutach
    }

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "SELECT conf_key, conf_value FROM configuration"
            cur.execute(sql)
            rows = cur.fetchall()
            for r in rows:
                k = r['conf_key']
                val_str = r['conf_value']
                if k == 'H_COST':
                    result['h_cost'] = float(val_str)
                elif k == 'ORDERING_COST':
                    result['ordering_cost'] = float(val_str)
                elif k == 'SAFETY_STOCK':
                    result['safety_stock'] = float(val_str)
                elif k == 'LEAD_TIME':
                    result['lead_time'] = float(val_str)
                elif k == 'DAYS_RANGE':
                    result['days_range'] = int(float(val_str))
                elif k == 'AUTO_RUN_INTERVAL':
                    result['auto_run_interval'] = int(val_str)
    finally:
        conn.close()

    return result
