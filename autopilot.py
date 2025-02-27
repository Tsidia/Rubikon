# autopilot.py
import schedule
import time
import threading

from services import load_config
from models.supplier_order_model import rop_eoq
from signals import system_event

# Globalna flaga, by w razie potrzeby móc zatrzymać pętlę
stop_autopilot = False

def autopilot_scheduler_loop():
    """
    Wątek #1: uruchamia schedule.run_pending() 
    co kilka sekund, dopóki nie ma stopu.
    """
    while not stop_autopilot:
        schedule.run_pending()
        time.sleep(5)  # w sekudach

def autopilot_config_loop():
    """
    Wątek #2: co 1 minutę sprawdza w bazie config,
    jeśli zmieni się auto_run_interval, aktualizuje schedule.
    """
    current_interval = 0
    while not stop_autopilot:
        cfg = load_config()
        new_interval = cfg.get('auto_run_interval', 0)
        new_interval = max(1, int(new_interval))  # minimalnie co 1 minuta

        if new_interval != current_interval:
            # czyścimy poprzedni harmonogram i ustawiamy nowy
            schedule.clear()
            schedule.every(new_interval).minutes.do(run_rop_eoq_job)
            current_interval = new_interval
            print(f"[AUTOPILOT] Zaktualizowano harmonogram na co {new_interval} min.")

        time.sleep(60)

def run_rop_eoq_job():
    """
    Funkcja opakowująca wywołanie algorytmu.
    """
    print("[AUTOPILOT] Uruchamiam run_rop_eoq() ...")
    system_event.send('autopilot', action='start_RopEoq')
    try:
        rop_eoq()
        print("[AUTOPILOT] Algorytm ROP+EOQ zakończył się.")
    except Exception as e:
        print(f"[AUTOPILOT] Błąd w rop_eoq(): {e}")
        system_event.send('autopilot', action='error_RopEoq', result=e)

def start_autopilot():
    """
    Funkcja do uruchomienia autopilota:
    """
    print("[AUTOPILOT] Start autopilota ...")

    # Wątek #1
    try:
        t1 = threading.Thread(target=autopilot_scheduler_loop, daemon=True)
        t1.start()

    # Wątek #2
        t2 = threading.Thread(target=autopilot_config_loop, daemon=True)
        t2.start()
    # Koniec – wątki działają w tle
        return (t1, t2)
    except Exception as e:
        print(f"[AUTOPILOT] Błąd w startcie autopilota: {e}")
        system_event.send('autopilot', action='error_autopilot', result=e)        
        return
