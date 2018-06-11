
class Person(object):
    age = 20
    gender = 'male'
    friends = []

    def __init__(self):
        print('Initializing...')

    def print_stats(self):
        print('Age:', self.age)
        print('Gender:', self.gender)
