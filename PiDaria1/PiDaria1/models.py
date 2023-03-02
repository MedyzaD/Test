from flask_login import UserMixin



class User(UserMixin):
    id 
    name = ""

    def __repr__(self):
        return '<User %r>' % (self.name)


