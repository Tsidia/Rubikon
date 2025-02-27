# signals.py
import os
from datetime import datetime
from blinker import signal

# Definicja sygnałów
system_event = signal('system_event')
delivery_event = signal('delivery_event')
config_event = signal('config_event')
warehouse_event = signal('warehouse_event')

LOG_FILE = os.path.join(os.path.dirname(__file__), "system_events.log")

def log_event(sender, **kwargs):
    """
    Funkcja obsługująca sygnały: 
    Zapisuje w pliku LOG_FILE szczegóły zdarzenia.
    """
    event_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_line = f"[{event_time}] SENDER={sender}; DATA={kwargs}\n"

    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(log_line)
    print(f"[LOG] Zapisano zdarzenie: {log_line.strip()}")

# Handler sygnałów
system_event.connect(log_event)
delivery_event.connect(log_event)
config_event.connect(log_event)
warehouse_event.connect(log_event)