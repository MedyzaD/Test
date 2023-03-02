import pymysql.cursors
import os
from app import card, card_table, card_id
from depersonalization_random import Hash

class DataBase(object):
    
    def __init__(self, host, user, password, namedb):
        self.isConnect = False
        self.cur = None
        self.con = None
        self.tables = []
        self.namedb = namedb
        self.host = host
        self.user = user 
        self.password = password
        try:
            self.con = pymysql.connect(host = host, user = user, password = password, database = namedb)
            self.cur = self.con.cursor()
            self.isConnect = True
            self.tables = self.get_tables()
        except Exception:
            pass


    def get_tables(self):
        if not self.isConnect:
            return []
        self.cur.execute("SHOW TABLES")
        schema = self.cur.fetchall()
        return [x[0] for x in schema]
         

    def get_field(self, table):
        if not self.isConnect:
            return []

        self.cur.execute("DESCRIBE " + table)
        field = self.cur.fetchall()
        return [x[0] for x in field]

    def get_tbody(self, table, 
                  sort = None,
                  search = None,
                  desc = False,
                  find = None):

        if not self.isConnect:
            return []

        ex = 'SELECT * FROM ' + table 
        if find :
            ex = ex + ' WHERE ' + search + ' = \"' + find + '\"'
        if sort :
            ex = ex + ' ORDER BY ' + sort + (' DESC' if desc else '')
        self.cur.execute(ex)
        return self.cur.fetchall()




def Copy(new_db, db):

    con = pymysql.connect(host = db.host, user = db.user, password = db.password)
    con.cursor().execute("DROP DATABASE IF EXISTS " + new_db.namedb)
    con.commit()
    con.cursor().execute("CREATE DATABASE " + new_db.namedb)
    con.commit()
    new_db.con = pymysql.connect(host = new_db.host, user = new_db.user, password = new_db.password, database = new_db.namedb)
    new_db.cur = new_db.con.cursor()
    new_db.isConnect = True


    dump = 'dump_' + db.namedb + '.sql'
    simport = 'mysqldump -u ' + db.user + ' -p' + db.password + ' --no-create-db -B ' + db.namedb + ' > ' + dump
    sexport = 'mysql -u ' + new_db.user + ' -p' + new_db.password + ' -B ' + new_db.namedb + ' < ' + dump
    os.system(simport)
    sdump = open(dump).read().replace(db.namedb, new_db.namedb)
    open(dump, 'w').write(sdump)
    os.system(sexport)

         
def Dep(new_db, db):
    if new_db.isConnect:
        return

    Copy(new_db, db)
    h = Hash()

    field = new_db.get_field(card_table)
    tbody = new_db.get_tbody(card_table)

    i = 0
    num = {}
    for name in field:
        num[name] = i
        i = i + 1

    for row in tbody:
        s = 'UPDATE ' + card_table + ' SET'
        i = 0
        for a in row:
            if str(a) != 'None':
                s = s + ' ' + field[i] + ' = \"' + h.do(card[field[i]], a) + '\",'
            i = i + 1
        s = s[:-1]
        s = s + ' WHERE ' + card_id + ' = \"' + str(row[num[card_id]]) + '\"'
        new_db.cur.execute(s)
        new_db.con.commit()
        

      