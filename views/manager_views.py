# manager_views.py
from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from werkzeug.security import generate_password_hash
from security_decorators import role_required
from services import get_connection, save_multiple_config, load_config
from models.user_model import get_all_users, add_user, update_user, delete_user, count_managers
from models.products import get_all_products, get_inventory_for_product, get_in_transit_for_product
from models.sales import get_sales_data_for_product, get_weighted_demand
from models.supplier_order_model import place_supplier_order_mock, get_all_suppliers, get_supplier_by_id, add_supplier, update_supplier, delete_supplier, mock_external_order_api, rop_eoq
from signals import system_event
from config import Config
import datetime
import math
import os

manager_bp = Blueprint('manager', __name__)

# Z tego pliku czytane są zdarzenia sytemowe
LOG_FILE = os.path.join(os.path.dirname(__file__), "..", "system_events.log")

@manager_bp.route('/dashboard')
@role_required(['manager'])
def manager_dashboard():
    """
    Główny panel menadżera
    """
    return render_template('manager_dashboard.html')

@manager_bp.route('/run_rop_eoq', methods=['POST'])
@role_required(['manager'])
def run_rop_eoq():
    """
    Główny endpoint uruchamiający algorytm ROP+EOQ dla każdego produktu:
    """
    orders_placed  = rop_eoq()
    flash(f"Algorytm ROP+EOQ zakończony. Złożono {orders_placed} zamówień.", "success")
    system_event.send('Panel menadżera', action=f"Algorytm ROP+EOQ zakończony. Złożono {orders_placed} zamówień.")
    return redirect(url_for('manager.manager_dashboard'))
    
@manager_bp.route('/config', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_config():
    """
    Zakładka 'Konfiguracja Aplikacji'. 
    Wyświetla formuły ROP, EOQ, D(weighted) oraz 
    pozwala edytować parametry:
        - h (H_COST)
        - K (ORDERING_COST)
        - SS (SAFETY_STOCK)
        - L (LEAD_TIME)
        - n (DAYS_RANGE)
        - a (AUTO_RUN_INTERVAL)
    """
    if request.method == 'POST':
        # Odbierz wartości z formularza
        h_cost = request.form.get('h_cost')
        ordering_cost = request.form.get('ordering_cost')
        safety_stock = request.form.get('safety_stock')
        lead_time = request.form.get('lead_time')
        days_range = request.form.get('days_range')
        auto_run_interval = request.form.get('auto_run_interval', '60')

        # Zapisz w bazie
        data = {
            "H_COST": h_cost,
            "ORDERING_COST": ordering_cost,
            "SAFETY_STOCK": safety_stock,
            "LEAD_TIME": lead_time,
            "DAYS_RANGE": days_range,
            "AUTO_RUN_INTERVAL": auto_run_interval
        }
        try:
            save_multiple_config(data)
            flash("Parametry zostały zapisane pomyślnie!", "success")
            system_event.send('Panel menadżera', action="Parametry konfiguracji rop eoq pomyślnie zmienione.", author=session.get('role_name'))
        except Exception as e:
            flash(f"Błąd przy zapisywaniu parametrów: {e}", "danger")
            system_event.send('Panel menadżera', action="Błąd przy zmiania konfiguracji rop eoq.", error=e)
        finally:
            return redirect(url_for('manager.manager_config'))

    # GET -> wczytujemy parametry z bazy
    current_config = load_config()
    return render_template('manager_config.html', config=current_config, role_name=session.get('role_name'))

@manager_bp.route('/manual_order', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_manual_order():
    """Zakładka do manualnego składania zamówień."""
    if request.method == 'POST':
        supplier_id = int(request.form.get('supplier_id'))

        # Pobierz lead_time
        supplier = get_supplier_by_id(supplier_id)
        if not supplier:
            flash("Nie znaleziono dostawcy", "danger")
            system_event.send('Panel menadżera', action="Błąd przy składaniu zamówienia", error="Nie ma dostawcy")
            return redirect(url_for('manager.manager_manual_order'))

        lead_time_days = supplier['lead_time_days'] or 0
        expected_delivery_date = datetime.datetime.now() + datetime.timedelta(days=lead_time_days)

        # Wywołaj mock API
        api_response = mock_external_order_api(supplier_id, "<multi-items>", 0)
        if not api_response['success']:
            flash("Błąd komunikacji z zewn. systemem", "danger")
            system_event.send('Panel menadżera', action="Błąd przy składaniu zamówienia", error="Nie udana komunikacja z api dostawcy")
            return redirect(url_for('manager.manager_manual_order'))

        # Stwórz zamówienie w supplier_orders
        created_by = 1
        conn = get_connection()
        try:
            with conn.cursor() as cur:
                sql_order = """
                INSERT INTO supplier_orders 
                  (supplier_id, order_date, expected_delivery_date, status, created_by_user_id)
                VALUES (%s, NOW(), %s, 'pending', %s)
                """
                cur.execute(sql_order, (supplier_id, expected_delivery_date, created_by))
                order_id = cur.lastrowid

                # Teraz wstawiamy wiele pozycji z formularza
                # Nie wiemy ile ich jest - możemy iterować po request.form
                product_items = []
                for key in request.form:
                    if key.startswith('product_id_'):
                        idx = key.split('_')[-1]  # np. '0', '1'
                        product_id = int(request.form.get(key))
                        quantity_str = request.form.get('quantity_' + idx)
                        quantity = int(quantity_str) if quantity_str else 0
                        if not quantity_str:
                            continue

                        product_items.append((product_id, quantity))

                # Wstaw do supplier_order_details
                sql_detail = """
                INSERT INTO supplier_order_details 
                  (supplier_order_id, product_id, quantity, cost_price)
                VALUES (%s, %s, %s, 50)
                """
                for (pid, qty) in product_items:
                    cur.execute(sql_detail, (order_id, pid, qty))

            conn.commit()
        finally:
            conn.close()

        flash("Zamówienie z wieloma produktami zostało złożone (zwrócono: %s)" % api_response['message'], "success")
        system_event.send('Panel menadżera', action="Manualne zamówienie sukces", author=session.get('role_name'))
        return redirect(url_for('manager.manager_manual_order'))

    # GET
    suppliers = get_all_suppliers()
    products = get_all_products()
    return render_template('manager_manual_order.html', suppliers=suppliers, products=products, role_name=session.get('role_name'))


@manager_bp.route('/suppliers', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_suppliers():
    """Zakładka zarządzania dostawcami"""
    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'add':
            try:
                supplier_name = request.form.get('supplier_name')
                contact_name = request.form.get('contact_name')
                phone_number = request.form.get('phone_number')
                email = request.form.get('email')
                address = request.form.get('address')
                comment = request.form.get('comment')
                add_supplier(supplier_name, contact_name, phone_number, email, address, comment)
                flash("Dodano nowego dostawcę.", "success")
                system_event.send('Panel menadżera', action="Dodano nowego dostawcę", author=session.get('role_name'))
            except Exception as e:
                flash(f"Nie udało się dodać dostawcy: {e}.", "danger")
                system_event.send('Panel menadżera', action="Nie udało się dodać dostawcy", error=e)

        elif action == 'delete':
            try:
                supplier_id = request.form.get('supplier_id', type=int)
                delete_supplier(supplier_id)
                flash("Usunięto dostawcę.", "warning")
                system_event.send('Panel menadżera', action="Usunięto dostawcę", author=session.get('role_name'))
            except Exception as e:
                flash(f"Nie udało się usunąć dostawcy: {e}.", "danger")
                system_event.send('Panel menadżera', action="Nie udało się usunąć dostawcy", error=e)
                
        elif action == 'edit':
            try:
                supplier_id = request.form.get('supplier_id', type=int)
                supplier_name = request.form.get('supplier_name')
                contact_name = request.form.get('contact_name')
                phone_number = request.form.get('phone_number')
                email = request.form.get('email')
                address = request.form.get('address')
                comment = request.form.get('comment')
                update_supplier(supplier_id, supplier_name, contact_name, phone_number, email, address, comment)
                flash("Zaktualizowano dostawcę.", "success")
                system_event.send('Panel menadżera', action="Edytowano dostawcę", author=session.get('role_name'))
            except Exception as e:
                flash(f"Nie udało się edytować dostawcy: {e}.", "danger")
                system_event.send('Panel menadżera', action="Nie udało się edytować dostawcy", error=e)                

        return redirect(url_for('manager.manager_suppliers'))

    # GET -> wyświetlamy listę
    suppliers = get_all_suppliers()
    return render_template('manager_suppliers.html', suppliers=suppliers, role_name=session.get('role_name'))


    # GET -> wyświetlamy listę dostawców
    suppliers = get_all_suppliers()
    return render_template('manager_suppliers.html', suppliers=suppliers, role_name=session.get('role_name'))


@manager_bp.route('/users', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_users():
    """
    Zakładka zarządzania użytkownikami
    """
    if request.method == 'POST':
        action = request.form.get('action')
        
        if action == 'add':
            try:
                email = request.form.get('email')
                password = request.form.get('password')
                role_name = request.form.get('role_name')
                first_name = request.form.get('first_name')
                last_name = request.form.get('last_name')

                # haszowanie hasła
                password_hash = generate_password_hash(password)
                
                add_user(email, password_hash, role_name, first_name, last_name)
                flash("Nowy użytkownik został dodany.", "success")
                system_event.send('Panel menadżera', action="Nowy użytkownik został dodany", author=session.get('role_name'))
            except Exception as e:
                flash(f"Nie udało się dodać użytkownika: {e}.", "danger")
                system_event.send('Panel menadżera', action="Nie udało się dodać użytkownika", error=e)                
                
        elif action == 'edit':
            try:
                user_id = int(request.form.get('user_id'))
                email = request.form.get('email')
                role_name = request.form.get('role_name')
                first_name = request.form.get('first_name')
                last_name = request.form.get('last_name')
                new_password = request.form.get('password')  # optional field

                password_hash = None
                if new_password:
                    password_hash = generate_password_hash(new_password)
                
                update_user(user_id, email, role_name, first_name, last_name, password_hash)
                flash("Zaktualizowano dane użytkownika.", "success")
                system_event.send('Panel menadżera', action="Użytkownik został edytowany", author=session.get('role_name'))
            except Exception as e:
                flash(f"Nie udało się zmodyfikować użytkownika: {e}.", "danger")
                system_event.send('Panel menadżera', action="Nie udało się zmodyfikować użytkownika", error=e)                
                
        elif action == 'delete':
            try:
                # Nie usuwaj ostatniego menadżera
                user_id = int(request.form.get('user_id'))
                role_name = request.form.get('role_name')
                if role_name == 'manager':
                    mgr_count = count_managers()
                    if mgr_count <= 1:
                        flash("Nie można usunąć jedynego menadżera!", "danger")
                        system_event.send('Panel menadżera', action="Nie udało się usunąć użytkownika", error="Użytkownik jest ostatnim menadżerem")
                        return redirect(url_for('manager.manager_users'))
                
                delete_user(user_id)
                flash("Użytkownik został usunięty.", "warning")
                system_event.send('Panel menadżera', action="Użytkownik został usunięty", author=session.get('role_name'))
            except Exception as e:
                flash(f"Nie udało się usunąć użytkownika: {e}.", "danger")
                system_event.send('Panel menadżera', action="Nie udało się usunąć użytkownika", error=e)                
        return redirect(url_for('manager.manager_users'))

    # GET
    all_users = get_all_users()
    possible_roles = ['manager', 'magazynier', 'sprzedawca', 'ksiegowy', 'customer']
    return render_template('manager_users.html', users=all_users, roles=possible_roles, role_name=session.get('role_name'))
    
@manager_bp.route('/reports', methods=['GET'])
@role_required(['manager'])
def manager_reports():
    """Panel raportowania"""
    view = request.args.get('view')
    products = get_all_products()
    
    if view == 'logs':
        page_str = request.args.get('page', '1')
        try:
            page = int(page_str)
        except ValueError:
            page = 1
        if page < 1:
            page = 1

        log_lines = []
        
        if os.path.exists(LOG_FILE):
            with open(LOG_FILE, "r", encoding="utf-8") as f:
                log_lines = f.readlines()
        
        # ZACHOWUJEMY TYLKO OSTATNIE 500 linii
        max_lines = 500
        if len(log_lines) > max_lines:
            log_lines = log_lines[-max_lines:]

        # Odwracamy, by najnowsze były na górze
        log_lines.reverse()

        # Każda strona 50 linii
        lines_per_page = 50
        total_lines = len(log_lines)
        total_pages = (total_lines + lines_per_page - 1) // lines_per_page

        # Zabezpieczenie by page nie przekraczał total_pages
        if page > total_pages and total_pages > 0:
            page = total_pages
        elif total_pages == 0:
            page = 1  # brak linii = 1 strona pusta

        start_idx = (page - 1) * lines_per_page
        end_idx = start_idx + lines_per_page
        page_lines = log_lines[start_idx:end_idx]

        # Formatowanie linii (rozbij datę od treści)
        # [YYYY-MM-DD HH:MM:SS] SENDER=abc; DATA=...
        # Rozdiel po pierwszym ']'
        formatted_lines = []
        for line in page_lines:
            line_strip = line.strip()
            date_str = None
            content = line_strip
            if line_strip.startswith("["):
                # znajdź zamknięcie
                pos = line_strip.find("]")
                if pos != -1:
                    date_str = line_strip[1:pos]  # bez nawiasów
                    content = line_strip[pos+1:].strip()
            
            formatted_lines.append((date_str, content))

        return render_template(
            'manager_reports.html',
            view='logs',
            products=products,
            log_lines=formatted_lines,  # (date, content)
            page=page,
            total_pages=total_pages,
            role_name=session.get('role_name')
        )
    
    else:
        # Wykres sprzedaży
        product_id = request.args.get('product_id')
        chart_labels = []
        chart_data = []
        
        if product_id:
            sales_data = get_sales_data_for_product(product_id)
            for row in sales_data:
                chart_labels.append(row['sale_date'])
                chart_data.append(row['quantity_sum'])

        return render_template(
            'manager_reports.html',
            view='chart',
            products=products,
            product_id=product_id,
            chart_labels=chart_labels,
            chart_data=chart_data,
            role_name=session.get('role_name')
        )

