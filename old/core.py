from flask import Flask
from config import Config

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
    app.run(host="127.0.0.1", port=5000, debug=True)
