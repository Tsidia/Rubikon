# store_views.py
from flask import Blueprint, render_template, request, session, redirect, url_for, flash
from models.products import get_all_products
from security_decorators import role_required
from models.customer_orders_model import place_order_for_customer
from signals import system_event

store_bp = Blueprint('store', __name__)

@store_bp.route('/store')
@role_required(['customer'])
def store_home():
    """
    Widok główny sklepu.
    Wyświetlamy listę produktów i przyciski "Dodaj do koszyka".
    """
    products = get_all_products()
    return render_template('store_home.html', products=products)

@store_bp.route('/store/add_to_cart/<int:product_id>', methods=['POST'])
@role_required(['customer'])
def add_to_cart(product_id):
    """
    Dodanie jednego produktu do koszyka (w session).
    Koszyk trzymamy w session['cart'] jako dict {product_id: quantity}.
    """
    cart = session.get('cart', {})
    cart[str(product_id)] = cart.get(str(product_id), 0) + 1
    session['cart'] = cart
    flash("Dodano produkt do koszyka.", "success")
    return redirect(url_for('store.store_home'))

@store_bp.route('/store/cart')
@role_required(['customer'])
def view_cart():
    """
    Widok koszyka: pokazane produkty + ilości
    """
    cart = session.get('cart', {}) # np. {'1':2, '3':1} => product_id: quantity
    return render_template('store_cart.html', cart=cart)

@store_bp.route('/store/checkout', methods=['POST'])
@role_required(['customer'])
def checkout():
    """
    Tworzymy nowe zamówienie w bazie (customer_orders + customer_order_details)
    i czyścimy koszyk w session.
    """
    cart = session.get('cart', {})
    if not cart:
        flash("Koszyk jest pusty.", "danger")
        return redirect(url_for('store.store_home'))
    try:
        user_id = session.get('user_id')
        shipping_address = "Adres testowy"
        order_id = place_order_for_customer(user_id, cart, shipping_address)

        session['cart'] = {}

        flash(f"Zamówienie zostało złożone (ID={order_id}).", "success")
        system_event.send('Sklep', action="Klient złożył zamówienie", author=session.get('role_name'))
    except Exception as e:
        flash(f"Nie udało się złożyć zamówienia jako klient: {e}.", "danger")
        system_event.send('Sklep', action="Nie udało się złożyć zamówienia jako klient:", error=e)                
                        
    return redirect(url_for('store.store_home'))
