#app.py
from flask import *
from config import Config
from datetime import timedelta
import os

from autopilot import start_autopilot
from signals import system_event

# Import blueprintów z folderu views
from views.auth_views import auth_bp
from views.accounting_views import accounting_bp
from views.warehouse_views import warehouse_bp
from views.manager_views import manager_bp
from views.store_views import store_bp

def create_app():
    """Funkcja tworząca obiekt aplikacji Flask z zarejestrowanymi blueprintami."""
    app = Flask(__name__)
    app.config.from_object(Config)
    app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(minutes=30) # Wyloguj po 30 minutach bez aktywności

    # Rejestracja blueprintów
    app.register_blueprint(auth_bp)
    app.register_blueprint(accounting_bp)
    app.register_blueprint(warehouse_bp)
    app.register_blueprint(manager_bp)
    app.register_blueprint(store_bp)
    
    return app



if __name__ == "__main__":
    # Gwarantuje że istnieje tylko jedna instancja autopilota
    if os.environ.get('WERKZEUG_RUN_MAIN') == 'true':
        threads = start_autopilot()
        system_event.send('app', action='started main app')
    app = create_app()
    
    @app.route("/")
    def home():
        """
        Jeśli użytkownik jest zalogowany -> przenosimy na jego dashboard.
        Jeśli nie jest zalogowany -> przenosimy na /login.
        """
        user_role = session.get("role_name")
        if user_role:
            # Jeśli jest zalogowany, przekieruj w zależności od roli
            if user_role == "manager":
                return redirect(url_for("manager.manager_dashboard"))
            elif user_role == "ksiegowy":
                return redirect(url_for("accounting.accounting_dashboard"))
            elif user_role == "magazynier":
                return redirect(url_for("warehouse.warehouse_dashboard"))
            elif user_role == "customer":
                return redirect(url_for("store.store_home"))
            else:
                # Fallback
                return redirect(url_for("auth.login"))
        else:
            # Brak zalogowanego użytkownika
            return redirect(url_for("auth.login"))
    app.run(host="127.0.0.1", port=5000, debug=True)
