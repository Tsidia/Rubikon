from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from werkzeug.security import check_password_hash
from datetime import datetime, timedelta
from models.user_model import get_user_by_email, reset_fail_attempts, register_fail_attempt


auth_bp = Blueprint('auth', __name__)

# login_attempts[ip] = {
#   'fail_count': int,
#   'blocked_until': datetime lub None
# }
login_attempts = {}
BLOCK_TIMEOUT = 10  # minut
MAX_FAILS = 3       # po tylu nieudanych próbach blokujemy

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    ip_addr = request.remote_addr  # IP użytkownika

    # 1. Sprawdź, czy IP nie jest zablokowane
    #    i czy blokada jeszcze trwa
    global login_attempts
    if ip_addr in login_attempts:
        data = login_attempts[ip_addr]
        blocked_until = data.get('blocked_until')
        if blocked_until and datetime.now() < blocked_until:
            # IP jest nadal zablokowane
            remaining = blocked_until - datetime.now()
            minutes_left = int(remaining.total_seconds() // 60) + 1
            flash(f"Twoje IP jest zablokowane na kolejne {minutes_left} min. Spróbuj później.", 'danger')
            return render_template("login.html",
                                   error_msg=f"Twoje IP zablokowane na kolejne {minutes_left} min.")

    if request.method == 'POST':
        # 2. Pobierz dane z formularza
        email = request.form.get('email')
        password = request.form.get('password')

        # 3. Sprawdź, czy taki użytkownik istnieje
        user = get_user_by_email(email)
        if not user:
            flash('Błędny login lub hasło.', 'danger')
            login_attempts = register_fail_attempt(ip_addr, login_attempts, MAX_FAILS, BLOCK_TIMEOUT)
            return redirect(url_for('auth.login'))

        # 4. Zweryfikuj hasło (check_password_hash)
        stored_hash = user['password_hash']  # np. "$pbkdf2-sha256$..."
        if check_password_hash(stored_hash, password):
            # Logowanie OK
            session['user_id'] = user['user_id']
            session['role_name'] = user['role_name']
            session.permanent = True
            flash('Zalogowano pomyślnie.', 'success')

            # Resetujemy licznik błędów
            login_attempts = reset_fail_attempts(ip_addr, login_attempts)

            # Przekierowanie do dashboardu zależnie od roli
            role = user['role_name']
            if role == 'manager':
                return redirect(url_for('manager.manager_dashboard'))
            elif role == 'ksiegowy':
                return redirect(url_for('accounting.accounting_dashboard'))
            elif role == 'magazynier':
                return redirect(url_for('warehouse.warehouse_dashboard'))
            elif role == 'customer':
                return redirect(url_for('store.store_home'))
            else:
                return redirect(url_for('home'))  # fallback
        else:
            # Błędne hasło
            flash('Błędny login lub hasło.', 'danger')
            register_fail_attempt(ip_addr)
            return redirect(url_for('auth.login'))

    # Metoda GET -> pokazujemy formularz logowania
    return render_template('login.html')

@auth_bp.route('/logout')
def logout():
    session.clear()
    flash('Wylogowano.', 'info')
    return redirect(url_for('auth.login'))