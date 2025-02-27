import os

class Config:
    # Klucz potrzebny do sesji Flaska, flash messages itp. Na potrzeby pracy klucze bezpośrednio w kodzie. W środowisku produkcyjnym potrzebne coś w stylu
    #SECRET_KEY = os.environ.get("SECRET_KEY")
    SECRET_KEY = "###kdsglfakl@#!@fg$1mg1f4124akmv"

    # Parametry bazy danych:
    DB_HOST = 'sql.freedb.tech'
    DB_USER = 'freedb_rubikon'
    DB_PASS = 'p3h%RnYB9HgeVbe'
    DB_NAME = 'freedb_rubikon'

    # Domyślne parametry algorytmu, fallback dla ładowania konfiguracji
    DEFAULT_SAFETY_STOCK = 0.25
    ORDERING_COST = 50.0
    HOLDING_COST = 2.0
    LEAD_TIME = 7
    DAYS_RANGE = 30
    AUTO_RUN_INTERVAL = 60

    # Dodatkowe ustawienia Flaska
    SESSION_COOKIE_NAME = "RubikonShopSession"
