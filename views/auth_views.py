from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from werkzeug.security import check_password_hash
from models.user_model import get_user_by_email

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # 1. Pobierz dane z formularza
        email = request.form.get('email')
        password = request.form.get('password')

        # 2. Sprawdź, czy taki użytkownik istnieje
        user = get_user_by_email(email)
        if not user:
            flash('Błędny login lub hasło.', 'danger')
            return redirect(url_for('auth.login'))

        # 3. Zweryfikuj hasło (check_password_hash)
        stored_hash = user['password_hash']  # np. "$pbkdf2-sha256$..."
        if check_password_hash(stored_hash, password):
            # 4. Logowanie OK
            session['user_id'] = user['user_id']
            session['role_name'] = user['role_name']
            session.permanent = True
            flash('Zalogowano pomyślnie.', 'success')

            # 5. Przekierowanie do dashboardu zależnie od roli
            role = user['role_name']
            if role == 'manager':
                return redirect(url_for('manager.manager_dashboard'))
            elif role == 'ksiegowy':
                return redirect(url_for('accounting.accounting_dashboard'))
            elif role == 'magazynier':
                return redirect(url_for('warehouse.warehouse_dashboard'))
            else:
                return redirect(url_for('home'))  # fallback
        else:
            # Błędne hasło
            flash('Błędny login lub hasło.', 'danger')
            return redirect(url_for('auth.login'))

    # Metoda GET -> pokazujemy formularz logowania
    return render_template('login.html')

@auth_bp.route('/logout')
def logout():
    session.clear()
    flash('Wylogowano.', 'info')
    return redirect(url_for('auth.login'))
