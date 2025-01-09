# user_model.py (przykład w folderze models/)

import pymysql
from config import Config
from typing import Optional

def get_connection():
    # Twój kod do łączenia się z bazą
    return pymysql.connect(
        host=Config.DB_HOST,
        user=Config.DB_USER,
        password=Config.DB_PASS,
        database=Config.DB_NAME,
        cursorclass=pymysql.cursors.DictCursor
    )

def get_user_by_email(email: str) -> Optional[dict]:
    """
    Pobiera użytkownika z bazy na podstawie email.
    Zwraca słownik z danymi (user_id, email, password_hash, role_name, ...)
    lub None, jeśli nie ma takiego użytkownika.
    """
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            sql = """
            SELECT user_id, email, password_hash, role_name
            FROM users
            WHERE email = %s
            LIMIT 1
            """
            cursor.execute(sql, (email,))
            user = cursor.fetchone()  # None, jeśli brak wierszy
        return user
    finally:
        conn.close()
