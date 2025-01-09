from flask import *
from config import Config
from datetime import timedelta

# Import blueprintów (widoków) z folderu views
# Zakładamy, że w views.__init__.py rejestrujesz blueprinty 
# lub w poszczególnych plikach masz obiekty blueprint
from views.auth_views import auth_bp
from views.accounting_views import accounting_bp
from views.warehouse_views import warehouse_bp
from views.manager_views import manager_bp



def create_app():
    """Funkcja tworząca obiekt aplikacji Flask z zarejestrowanymi blueprintami."""
    app = Flask(__name__)
    app.config.from_object(Config)
    app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(minutes=30)

    # Rejestracja blueprintów
    app.register_blueprint(auth_bp)
    app.register_blueprint(accounting_bp)
    app.register_blueprint(warehouse_bp)
    app.register_blueprint(manager_bp)

    # (opcjonalnie) Inicjalizacja bazy danych, schedulera itp.
    # init_db(app)
    # init_scheduler(app)
    
    
    return app



if __name__ == "__main__":
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
            else:
                # Gdyby była inna rola lub brak warunku
                return redirect(url_for("auth.login"))
        else:
            # Brak zalogowanego użytkownika
            return redirect(url_for("auth.login"))
    
    app.run(host="127.0.0.1", port=5000, debug=True)
