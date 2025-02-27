# warehouse_views.py
from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from security_decorators import role_required
from models.inventory_model import get_all_inventory, update_inventory_quantity
from models.supplier_order_model import get_pending_deliveries, get_supplier_order, confirm_supplier_delivery
from models.customer_orders_model import get_pending_shippings, get_customer_order, confirm_customer_shipping
from models.products import get_all_products, get_inventory_for_product, get_in_transit_for_product
from models.sales import get_weighted_demand
from signals import system_event
import math
from services import load_config
from config import Config

warehouse_bp = Blueprint('warehouse', __name__)

@warehouse_bp.route('/warehouse')
@role_required(['magazynier', 'manager'])
def warehouse_dashboard():
    """
    Główny dashboard.
    """
    return render_template('warehouse_dashboard.html', role_name=session.get('role_name'))

@warehouse_bp.route('/magazyn', methods=['GET', 'POST'])
@role_required(['magazynier', 'manager'])
def warehouse_inventory():
    """
    Widok stanu magazynowego z informacjami o tym, jak daleko jest od ROP.
    """
    if request.method == 'POST':
        product_id = request.form.get('product_id', type=int)
        new_quantity = request.form.get('new_quantity', type=int)
        if product_id and new_quantity is not None:
            try:
                update_inventory_quantity(product_id, new_quantity)
                flash(f"Skorygowano stan magazynowy produktu ID={product_id} na {new_quantity}.", "success")
                system_event.send('Panel magazyniera', action=f"Skorygowano stan magazynowy produktu ID={product_id} na {new_quantity}.", author=session.get('role_name'))
            except Exception as e:
                flash(f"Błąd przy aktualizacji stanu: {e}", "danger")
                system_event.send('Panel magazyniera', action="Nie udało się skorygować stanu magazynu", error=e)   
        else:
            flash("Niepoprawne dane w formularzu korekty.", "danger")
        # Na końcu i tak przejdziemy do render_template żeby zobaczyć zaktualizowany stan    
    try:
        items = compute_rop_for_warehouse()
        final_items = []
        # rop_eoq_data = { product_id: { 'product_name', 'stock_now', 'rop', 'diff', 'eoq' } }
        # Musimy przekształcić to do listy do wyświetlenia.
        for item in items:
            # Obliczamy color zależnie od diff/rop
            product_id = item['product_id']
            rop = item['rop']
            diff = item['diff']
            # np. color logic
            if rop <= 0:
                color_class = 'table-success'  # rop=0 => żadnego problemu
            else:
                ratio = diff / rop  # np. diff/rop
                if ratio < 0:
                    color_class = 'table-danger'
                elif ratio < 0.2:
                    color_class = 'table-warning'
                else:
                    color_class = 'table-success'

            final_items.append({
                'product_id': product_id,
                'product_name': item['product_name'],
                'stock_now': item['stock_now'],
                'rop': round(item['rop'], 2),
                'diff': round(diff, 2),
                'color_class': color_class
            })

        # Można posortować items np. po product_id
        items.sort(key=lambda x: x['product_id'])
        print(items)

        return render_template('warehouse_inventory.html', items=final_items, role_name=session.get('role_name'))
    except Exception as e:
        flash(f"Wystąpił błąd: {e}", "danger")
        system_event.send('Panel magazyniera', action="Wystąpił błąd:", error=e)   
        return redirect(url_for('warehouse.warehouse_dashboard'))


@warehouse_bp.route('/deliveries')
@role_required(['magazynier', 'manager'])
def warehouse_deliveries():
    """
    Wyświetla listę aktualnie oczekiwanych dostaw Magazynier może potwierdzić dostawę.
    """
    try:
        deliveries = get_pending_deliveries()
        return render_template('warehouse_deliveries.html', 
                               deliveries=deliveries, 
                               role_name=session.get('role_name'))
    except Exception as e:
        flash(f"Błąd podczas wczytywania dostaw: {e}", "danger")
        system_event.send('deliveries', action='error', details=e)
        return redirect(url_for('warehouse.warehouse_dashboard'))


@warehouse_bp.route('/deliveries/<int:supplier_order_id>/confirm', methods=['POST'])
@role_required(['magazynier', 'manager'])
def confirm_delivery(supplier_order_id):
    """
    Mechanizm przyjmowania towaru od dostawcy.
    """
    try:
        order = get_supplier_order(supplier_order_id)
        if not order:
            flash("Nie znaleziono dostawy o podanym ID.", "danger")
            return redirect(url_for('warehouse.warehouse_deliveries'))

        confirm_supplier_delivery(supplier_order_id)

        flash(f"Dostawa {supplier_order_id} została potwierdzona i zaktualizowano stany.", "success")
        system_event.send('deliveries', action='confirm_delivery', order_id=supplier_order_id)
        return redirect(url_for('warehouse.warehouse_deliveries'))
    except Exception as e:
        flash(f"Błąd podczas potwierdzania dostawy: {e}", "danger")
        system_event.send('deliveries', action='error_confirm_delivery', order_id=supplier_order_id, details=str(e))
        return redirect(url_for('warehouse.warehouse_deliveries'))

@warehouse_bp.route('/shippings')
@role_required(['magazynier', 'manager'])
def warehouse_shippings():
    """
    Analogicznie: lista zamówień od klientów (pending shipping).
    Magazynier może 'kliknąć' i potwierdzić wysyłkę do klienta.
    """
    try:
        orders = get_pending_shippings()
        return render_template('warehouse_shippings.html', 
                               orders=orders, 
                               role_name=session.get('role_name'))
    except Exception as e:
        flash(f"Błąd podczas wczytywania wysyłek: {e}", "danger")
        system_event.send('shippings', action='error_loading_shippings', details=str(e))
        return redirect(url_for('warehouse.warehouse_dashboard'))


@warehouse_bp.route('/shippings/<int:customer_order_id>/confirm', methods=['POST'])
@role_required(['magazynier', 'manager'])
def confirm_shipping(customer_order_id):
    """
    Wysyłka towaru do klienta.
    """
    try:
        order = get_customer_order(customer_order_id)
        if not order:
            flash("Nie znaleziono zamówienia klienta o podanym ID.", "danger")
            return redirect(url_for('warehouse.warehouse_shippings'))

        confirm_customer_shipping(customer_order_id)

        flash(f"Wysłano zamówienie klienta {customer_order_id}.", "success")
        system_event.send('shippings', action='confirm_shipping', order_id=customer_order_id)
        return redirect(url_for('warehouse.warehouse_shippings'))
    except Exception as e:
        flash(f"Błąd podczas potwierdzania wysyłki: {e}", "danger")
        system_event.send('shippings', action='error_confirm_shipping', order_id=customer_order_id, details=str(e))
        return redirect(url_for('warehouse.warehouse_shippings'))


def compute_rop_for_warehouse():
    """
    Uproszczona wersja algorytmu ROP/EOQ:
    - Nie składa zamówień,
    - Zwraca listę dictów: [ { product_id, product_name, stock_now, rop, diff, color_class }, ... ]
    """

    # 1) Wczytujemy parametry z configu
    config = load_config()
    SS = config.get('safety_stock', Config.DEFAULT_SAFETY_STOCK)
    L = config.get('lead_time', Config.LEAD_TIME)
    n = config.get('days_range', Config.DAYS_RANGE)  # do Weighted Demand

    # 2) Lista produktów
    products = get_all_products()
    items = []

    for p in products:
        product_id = p['product_id']
        product_name = p['product_name']

        # Oblicz Weighted Demand
        D_weighted = get_weighted_demand(product_id, n)  # np. s. 'sales' model

        # ROP
        rop = D_weighted * L + SS

        # Stan magazynu dla ROP = quantity_in_stock + in_transit
        inv_info = get_inventory_for_product(product_id)
        print(inv_info)
        in_transit = get_in_transit_for_product(product_id)
        stock_now = inv_info['quantity_in_stock'] + in_transit

        diff = float(stock_now) - float(rop)

        # Kolor zależny od diff/rop
        if rop <= 0:
            color_class = 'table-success'
        else:
            ratio = diff / rop
            if ratio < 0:
                color_class = 'table-danger'
            elif ratio < 0.2:
                color_class = 'table-warning'
            else:
                color_class = 'table-success'

        items.append({
            'product_id': product_id,
            'product_name': product_name,
            'stock_now': inv_info['quantity_in_stock'],
            'rop': round(rop, 2),
            'diff': round(diff, 2),
            'color_class': color_class
        })

    # posortuj po product_id
    items.sort(key=lambda x: x['product_id'])
    return items