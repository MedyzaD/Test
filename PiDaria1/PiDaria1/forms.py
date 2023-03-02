from flask_wtf import FlaskForm
from wtforms import StringField, BooleanField, SelectField
from wtforms.validators import DataRequired 

class LoginForm(FlaskForm): 
    openid = StringField('openid', validators = [DataRequired()])

class Search(FlaskForm):
    sort_column = SelectField('sort_column')
    search_column = SelectField('search_column')
    desc = BooleanField('desc', default = False)
    win_search = StringField('win_search')


