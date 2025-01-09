# views/warehouse_views.py

from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from models.inventory_model import (
    get_all_inventory,
    update_inventory_quantity
)
from models.supplier_order_model import (
    get_pending_deliveries,
    get_supplier_order,
    confirm_supplier_delivery
)
from security_decorators import role_required

warehouse_bp = Blueprint('warehouse', __name__)

@warehouse_bp.route('/warehouse')
@role_required(['magazynier', 'manager'])
def warehouse_dashboard():
    """
    Główne wejście do panelu magazyniera:
      - Lista podstawowych informacji o dostępnych produktach
      - Link do listy dostaw
      - Link do manualnej korekty
    """
    products = get_all_inventory()  # Pobiera z bazy informację o produktach i ich stanach
    return render_template('warehouse_dashboard.html', products=products, role_name=session.get('role_name'))


@warehouse_bp.route('/deliveries')
@role_required(['magazynier', 'manager'])
def warehouse_deliveries():
    """
    Wyświetla listę aktualnie oczekiwanych dostaw (np. status 'pending' lub 'shipped').
    Magazynier może 'kliknąć' i potwierdzić dostawę.
    """
    deliveries = get_pending_deliveries()  # np. SELECT * FROM supplier_orders WHERE status IN ('pending', 'shipped')
    return render_template('warehouse_deliveries.html', deliveries=deliveries, role_name=session.get('role_name'))


@warehouse_bp.route('/deliveries/<int:supplier_order_id>/confirm', methods=['POST'])
@role_required(['magazynier', 'manager'])
def confirm_delivery(supplier_order_id):
    """
    Mechanizm A:
    - Magazynier potwierdza, że dostawa o ID supplier_order_id została faktycznie odebrana
    - System automatycznie zmienia status w 'supplier_orders' na 'delivered'
    - Dodaje ilości z 'supplier_order_details' do inventory
    """
    order = get_supplier_order(supplier_order_id)
    if not order:
        flash("Nie znaleziono dostawy o podanym ID.", "danger")
        return redirect(url_for('warehouse.warehouse_deliveries'))

    # Wywołujemy logikę potwierdzającą dostawę (zmiana statusu + aktualizacja inventory)
    confirm_supplier_delivery(supplier_order_id)

    flash(f"Dostawa {supplier_order_id} została potwierdzona i stany magazynowe zaktualizowane.", "success")
    return redirect(url_for('warehouse.warehouse_deliveries'))


@warehouse_bp.route('/manual_correction', methods=['GET', 'POST'])
@role_required(['magazynier', 'manager'])
def manual_correction():
    """
    Mechanizm B:
    Formularz do ręcznego korygowania stanów magazynowych.
    - GET: wyświetla listę produktów, w inputach można wpisać nową ilość
    - POST: zapisuje zmiany w bazie
    """
    if request.method == 'POST':
        # Odbieramy dane z formularza
        product_id = request.form.get('product_id', type=int)
        new_quantity = request.form.get('new_quantity', type=int)

        # Można ewentualnie walidować: czy product_id istnieje, czy new_quantity >= 0, itp.
        if product_id and new_quantity is not None:
            update_inventory_quantity(product_id, new_quantity)
            flash(f"Skorygowano stan magazynowy produktu ID={product_id} na {new_quantity}.", "success")
        else:
            flash("Niepoprawne dane w formularzu.", "danger")

        return redirect(url_for('warehouse.manual_correction'))

    # Metoda GET -> wyświetlamy listę wszystkich produktów z możliwością edycji
    products = get_all_inventory()
    return render_template('warehouse_manual.html', products=products, role_name=session.get('role_name'))
