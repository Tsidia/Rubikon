# manager_views.py
from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from security_decorators import role_required
from services import *

manager_bp = Blueprint('manager', __name__)

@manager_bp.route('/dashboard')
@role_required(['manager'])
def manager_dashboard():
    """
    Główny panel menadżera:
      - Link do konfiguracji parametrów aplikacji,
      - Link do zarządzania dostawcami,
      - Link do manualnego zamawiania,
      - (W przyszłości) linki do raportów.
    """
    return render_template('manager_dashboard.html')

@manager_bp.route('/config', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_config():
    """
    Zarządzanie parametrami aplikacji (np. safety stock, ordering cost, holding cost, lead time).
    Po zapisaniu w bazie lub pliku konfiguracyjnym odśwież stronę.
    """
    if request.method == 'POST':
        safety_stock = request.form.get('safety_stock')
        ordering_cost = request.form.get('ordering_cost')
        holding_cost = request.form.get('holding_cost')
        lead_time = request.form.get('lead_time')
        # Zapisz do bazy / pliku
        save_config(safety_stock, ordering_cost, holding_cost, lead_time)
        flash("Konfiguracja zapisana pomyślnie!", "success")
        return redirect(url_for('manager.manager_config'))

    # GET -> odczytaj obecne parametry
    current_config = load_config()  # np. {'safety_stock': '0.25', ...}
    return render_template('manager_config.html', config=current_config, role_name=session.get('role_name'))

@manager_bp.route('/manual_order', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_manual_order():
    """
    Menadżer ręcznie składa zamówienie do wybranego dostawcy.
    - GET: formularz (wybór dostawcy, wybór produktu, ilości itp.).
    - POST: przetworzenie danych, utworzenie zamówienia w bazie.
    """
    if request.method == 'POST':
        supplier_id = request.form.get('supplier_id')
        product_id = request.form.get('product_id')
        quantity = request.form.get('quantity', type=int)
        # Dodaj do bazy (np. tworzymy rekord w supplier_orders).
        create_manual_order(supplier_id, product_id, quantity)
        flash("Zamówienie zostało złożone.", "success")
        return redirect(url_for('manager.manager_manual_order'))

    # GET -> wyświetlamy listę dostawców, listę produktów do wyboru
    suppliers = get_all_suppliers()  
    products = get_all_products()  
    return render_template('manager_manual_order.html', suppliers=suppliers, products=products, role_name=session.get('role_name'))

@manager_bp.route('/suppliers', methods=['GET', 'POST'])
@role_required(['manager'])
def manager_suppliers():
    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'add':
            supplier_name = request.form.get('supplier_name')
            contact_name = request.form.get('contact_name')
            phone_number = request.form.get('phone_number')
            email = request.form.get('email')
            address = request.form.get('address')
            add_supplier(supplier_name, contact_name, phone_number, email, address)
            flash("Dodano nowego dostawcę.", "success")

        elif action == 'delete':
            supplier_id = request.form.get('supplier_id', type=int)
            delete_supplier(supplier_id)
            flash("Usunięto dostawcę.", "warning")

        elif action == 'edit':
            supplier_id = request.form.get('supplier_id', type=int)
            supplier_name = request.form.get('supplier_name')
            contact_name = request.form.get('contact_name')
            phone_number = request.form.get('phone_number')
            email = request.form.get('email')
            address = request.form.get('address')
            update_supplier(supplier_id, supplier_name, contact_name, phone_number, email, address)
            flash("Zaktualizowano dostawcę.", "success")

        return redirect(url_for('manager.manager_suppliers'))

    # GET -> wyświetlamy listę
    suppliers = get_all_suppliers()
    return render_template('manager_suppliers.html', suppliers=suppliers, role_name=session.get('role_name'))


    # GET -> wyświetlamy listę dostawców
    suppliers = get_all_suppliers()
    return render_template('manager_suppliers.html', suppliers=suppliers, role_name=session.get('role_name'))
