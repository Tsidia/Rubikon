import os

class Config:
    # Klucz potrzebny do sesji Flaska, flash messages itp.
    SECRET_KEY = os.environ.get("SECRET_KEY")

    # Parametry bazy danych:
    DB_HOST = 'sql.freedb.tech'     # np. 'your-db-host.com'
    DB_USER = 'freedb_rubikon'       # nazwa użytkownika w MySQL
    DB_PASS = 'p3h%RnYB9HgeVbe'           # hasło do bazy
    DB_NAME = 'freedb_rubikon'            # nazwa bazy danych, którą utworzymy / będziemy używać

    # Przykładowe domyślne parametry algorytmu, które menadżer może nadpisać
    DEFAULT_SAFETY_STOCK = 0.25
    ORDERING_COST = 50.0
    HOLDING_COST = 2.0
    LEAD_TIME = 7

    # Dodatkowe ustawienia Flaska
    SESSION_COOKIE_NAME = "RubikonShopSession"
