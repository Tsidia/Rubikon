# user_model.py
import pymysql
from config import Config
from typing import Optional
from services import get_connection
from datetime import datetime, timedelta

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

def get_all_users():
    """Znajduje wszystkich użytkowników"""
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            SELECT user_id, email, password_hash, role_name, first_name, last_name
            FROM users
            ORDER BY user_id
            """
            cur.execute(sql)
            return cur.fetchall()  # list of dict
    finally:
        conn.close()

def add_user(email, password_hash, role_name, first_name, last_name):
    """Dodaje nowego użytkownika do bazy danych"""
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = """
            INSERT INTO users (email, password_hash, role_name, first_name, last_name, created_at)
            VALUES (%s, %s, %s, %s, %s, NOW())
            """
            cur.execute(sql, (email, password_hash, role_name, first_name, last_name))
        conn.commit()
    finally:
        conn.close()

def update_user(user_id, email, role_name, first_name, last_name, password_hash=None):
    """
    Wstawia nowe dane dla wybranego użytkownika. Jeśli password_hash jest None, nie updatuj hasła;
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            if password_hash:
                sql = """
                UPDATE users
                SET email=%s,
                    role_name=%s,
                    first_name=%s,
                    last_name=%s,
                    password_hash=%s
                WHERE user_id=%s
                """
                cur.execute(sql, (email, role_name, first_name, last_name, password_hash, user_id))
            else:
                sql = """
                UPDATE users
                SET email=%s,
                    role_name=%s,
                    first_name=%s,
                    last_name=%s
                WHERE user_id=%s
                """
                cur.execute(sql, (email, role_name, first_name, last_name, user_id))
        conn.commit()
    finally:
        conn.close()

def delete_user(user_id):
    """Usuwa wybranego użytkownika z bazy danych uważaj by nie usuwać ostatniego menadżera i ogólnie ostrożny bądź z tym"""
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "DELETE FROM users WHERE user_id=%s"
            cur.execute(sql, (user_id,))
        conn.commit()
    finally:
        conn.close()

def count_managers():
    """
    Zwraca ile jest obecnie menadżerów w systemie'
    """
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            sql = "SELECT COUNT(*) AS mgr_count FROM users WHERE role_name='manager'"
            cur.execute(sql)
            row = cur.fetchone()
            return row['mgr_count'] if row else 0
    finally:
        conn.close()

def register_fail_attempt(ip_addr, login_attempts, MAX_FAILS, BLOCK_TIMEOUT):
    """
    Zwiększa licznik nieudanych prób logowania dla danego IP.
    Jeśli licznik osiągnie MAX_FAILS, ustawia blokadę na BLOCK_TIMEOUT minut.
    """

    if ip_addr not in login_attempts:
        login_attempts[ip_addr] = {'fail_count': 0, 'blocked_until': None}

    data = login_attempts[ip_addr]
    data['fail_count'] += 1

    # Jeśli osiągnęliśmy limit
    if data['fail_count'] >= MAX_FAILS:
        data['blocked_until'] = datetime.now() + timedelta(minutes=BLOCK_TIMEOUT)
        data['fail_count'] += 1
    return login_attempts

def reset_fail_attempts(ip_addr, login_attempts):
    """
    Resetuje licznik błędów i blokadę dla danego IP
    (po udanym logowaniu).
    """
    if ip_addr in login_attempts:
        login_attempts[ip_addr]['fail_count'] = 0
        login_attempts[ip_addr]['blocked_until'] = None
    return login_attempts
