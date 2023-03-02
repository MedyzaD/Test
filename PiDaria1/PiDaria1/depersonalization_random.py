from random import randint


class Hash:
    def __init__(self):
        self.isUsed = False

    def do(self, command, data_):
        data = str(data_)
        match command:
            case 'text':
                return self.text(data)
            case 'not_change':
                return self.not_change(data)
            case 'date':
                return self.date(data)
            case 'number':
                return self.number(data)
            case 'address':
                return self.address(data)
            case 'email':
                return self.email(data)

    def text(self, data):

        new_str = ''
        for index, letter in enumerate(data):
            c = randint(1, 10)
            t = ord(letter) + c
            if ((t > ord('Z')) and (t < ord('a'))) or (t > ord('z')):
                t -= c + 1
            new_str += chr(t)
        return new_str

    def not_change(self, data):
        return data

    def date(self, data):
        year, month, day = data.split('-')
        year = int(year)
        year -= randint(-42, 42)
        year = str(year)
        year_new = year[2] + year[0] + year[3] + year[1]
        month = str((int(month) + randint(0, 10)) % 12 + 1)
        day = str((int(day) + randint(-21, 21)) % 28)
        return '-'.join((year_new, month, day))

    def number(self, data):
        number_new = ''
        for index, letter in enumerate(str(data)):
            number_new += str((int(letter) * randint(1, 10) + randint(0, 10)) % 10)
        return number_new

    def address(self, data):
        city, street, dom = data.split(', ')
        new_city = self.text(city)
        new_street = self.text(street)
        dom = str(int(dom) + randint(-30, 30))
        return ', '.join((new_city, new_street, dom))

    def email(self, data):
        before_at, after_at = data.split('@')
        before_dot, after_dot = after_at.split('.')
        new_email = self.text(before_at)
        new_domen = self.text(before_dot)
        return new_email + '@' + new_domen + '.' + after_dot

