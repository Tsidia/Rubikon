from flask import Blueprint, render_template

accounting_bp = Blueprint('accounting', __name__)

@accounting_bp.route('/accounting')
#@role_required(['ksiegowy', 'manager'])
def accounting_dashboard():
    # Wyciągnij dane finansowe z bazy
    # np. total_income, total_expenses, ...
    # logicznie: analyzer = get_financial_analyzer()
    # finances = analyzer.get_current_finances()
    finances = {
        'total_income': 12345.67,
        'total_expenses': 4567.89,
        'profit': 12345.67 - 4567.89
    }
    return render_template('accounting.html', finances=finances)