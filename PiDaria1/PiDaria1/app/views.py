from flask import render_template, flash, redirect, session, url_for, request, g
from flask_login import login_user, logout_user, current_user, login_required
from app import app, lm, db, ps, new_db
from forms import LoginForm, Search
from models import User
from depers import Dep



@app.route('/')
@app.route('/index')
def index():
    return render_template("index.html",
        namedb = db.namedb)

@lm.request_loader 
def load_user(request):
    name = User.name
    if name == ps:
        return User
    return None

@app.before_request 
def before_request():
    g.user = current_user 

@app.route('/login', methods = ['GET', 'POST'])
def login():
    if g.user.get_id() is not None: 
        return redirect(url_for('index'))
    form = LoginForm() 
    if form.validate_on_submit():
        User.name = form.openid.data
        login_user(g.user)
        return redirect(request.args.get('next') or url_for('index')) 
    return render_template('login.html', 
        form = form)

@app.route('/logout')
@login_required 
def logout():
    logout_user()
    User.name = ""
    return redirect(url_for('index'))

@app.route('/database')
def database():
    Dep(new_db, db)

    return render_template("database.html", 
        tables = new_db.get_tables(),
        isTableOpen = False)

@app.route('/database/<table>', methods = ['GET', 'POST'])
def database_t(table):
    Dep(new_db, db)

    tables = new_db.get_tables()
    if table not in tables:
        flash('Table ' + table + ' not found.')
        return redirect(url_for('database'))

    field = new_db.get_field(table)
    form = Search()
    form.sort_column.choices = [(f, f) for f in field]
    form.search_column.choices = [(f, f) for f in field]
    
    tbody = new_db.get_tbody(table, 
                             sort = form.sort_column.data,
                             search = form.search_column.data,
                             desc = form.desc.data,
                             find = form.win_search.data)

    return render_template("database.html", 
        tables = tables,
        field = field,
        tbody = tbody,
        form = form,
        isTableOpen = True)

@app.route('/admin')
@login_required 
def admin():
    return render_template("index.html",
        namedb = db.namedb)

