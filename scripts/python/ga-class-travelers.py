class Traveler(object):
    continents = ['North America','South America','Asia','Europe',
        'Africa','Antarctica','Australia'] # a class variable

    def __init__(self, name='Fred', visited=['Asia','Europe']):
        self.name = name  # instance variable
        self.visited = visited  # instance variable
