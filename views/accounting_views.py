# accounting_views.py
from datetime import datetime, timedelta
from services import get_connection
from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from security_decorators import role_required
from models.customer_orders_model import get_orders_for_accounting, update_payment_status, get_payment_status_counts, get_total_revenue, get_total_cost, get_daily_revenue_cost
from signals import system_event

accounting_bp = Blueprint('accounting', __name__)

@accounting_bp.route('/accounting')
@role_required(['ksiegowy', 'manager'])
def accounting_dashboard():
    """
    Główny panel księgowego.
    """
    return render_template('accounting_dashboard.html', role_name=session.get('role_name'))

@accounting_bp.route('/accounting/orders', methods=['GET', 'POST'])
@role_required(['ksiegowy', 'manager'])
def accounting_orders():
    """
    Przegląd zamówień i statusów płatności.
    """
    if request.method == 'POST':
        # Ręczna zmiana statusu płatności
        order_id = request.form.get('order_id', type=int)
        new_status = request.form.get('new_payment_status')
        if order_id and new_status:
            try:
                update_payment_status(order_id, new_status)
                flash(f"Zmieniono status płatności zamówienia {order_id} na '{new_status}'.", "success")
                system_event.send('księgowość', action=f"Zmieniono status płatności zamówienia {order_id} na '{new_status}'.")
            except Exception as e:
                flash(f"Błąd przy zmianie statusu: {e}", "danger")
                system_event.send('księgowość', action=f"Błąd przy zmianie statusu: {e}")
        return redirect(url_for('accounting.accounting_orders'))

    # GET -> filtrujemy
    filter_status = request.args.get('filter_status', '')  # np. 'pending', 'paid'
    orders = get_orders_for_accounting(filter_status)  # pobiera z bazy

    # Raport: ile w każdym statusie?
    status_counts = get_payment_status_counts()

    return render_template(
        'accounting_orders.html',
        orders=orders,
        filter_status=filter_status,
        status_counts=status_counts,
        role_name=session.get('role_name')
    )
    
@accounting_bp.route('/accounting/finance', methods=['GET'])
@role_required(['ksiegowy', 'manager'])
def finance_report():
    """
    Przegląd kosztów i zysków.
    """
    period = request.args.get('period', 'all')  # 'month','quarter','year','all'
    
    # Ustal start_date, end_date
    end_date = datetime.now()
    if period == 'month':
        start_date = end_date - timedelta(days=30)
    elif period == 'quarter':
        start_date = end_date - timedelta(days=90)
    elif period == 'year':
        start_date = end_date - timedelta(days=365)
    else:
        # all => brak filtra
        start_date = None
        end_date = None

    if start_date and end_date:
        start_str = start_date.strftime("%Y-%m-%d")
        end_str = end_date.strftime("%Y-%m-%d")
    else:
        start_str = None
        end_str = None

    daily_data = get_daily_revenue_cost(start_str, end_str)
    total_revenue = sum(float(d['revenue']) for d in daily_data)
    total_cost    = sum(float(d['cost']) for d in daily_data)
    profit        = total_revenue - total_cost

    # Przygotuj dane do wykresu (Chart.js)
    # etykiety = tablica dat
    chart_labels = [row['report_date'] for row in daily_data]
    chart_data_rev = [row['revenue'] for row in daily_data]
    chart_data_cost = [row['cost'] for row in daily_data]

    return render_template(
        'accounting_finance.html',
        period=period,
        total_revenue=round(total_revenue,2),
        total_cost=round(total_cost,2),
        profit=round(profit,2),
        chart_labels=chart_labels,
        chart_data_rev=chart_data_rev,
        chart_data_cost=chart_data_cost,
        role_name=session.get('role_name')
    )