# security_decorators.py
from functools import wraps
from flask import session, redirect, url_for, flash

def role_required(roles):
    """
    roles: lista dozwolonych ról, np. ['manager'] lub ['magazynier', 'manager']
    """
    def wrapper(func):
        @wraps(func)
        def decorated_view(*args, **kwargs):
            user_role = session.get('role_name')
            if not user_role or user_role not in roles:
                flash('Brak uprawnień.', 'danger')
                return redirect(url_for('auth.login'))
            return func(*args, **kwargs)
        return decorated_view
    return wrapper
