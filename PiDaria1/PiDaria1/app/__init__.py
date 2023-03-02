from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from tmp.keys import host, user, password, namedb, ps, card, card_table, card_id
from depers import DataBase

app = Flask(__name__)
app.config.from_object('config')

db = DataBase(host, user, password, namedb)
new_db = DataBase(host, user, password, 'new_' + namedb)

lm = LoginManager()
lm.init_app(app)
lm.login_view = 'login'

from app import views