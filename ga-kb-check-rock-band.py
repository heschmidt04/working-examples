# Recall that a class is essentially the blueprint of a provided object 
# and that it is created using the process of instantiation.

# Imagine that you are working with music data 
# and want to define a class to represent a band. 
# The class should have five attributes 
# (the name of the band, 
# number of members in the band, 
# number of albums released, 
# number of records sold, and the genre) that describe the object being assigned to that class.

# Task: For this challenge, you are to write the code needed to define a class for a 
# band, and initiate it for the ban Queen and return the printed stats as shown below. 
# HINT: you cause the string method format 
# within the print_stats method to help you return the full set of information.

band: Queen members: 4 albums: 15 sold: 105000000 genre: Rock

class Band(object):
    def __init__(self, band='Queen',members=4,albums=15,albums_sold=105000000,genre='Rock'):
        self.band = band
        self.members = members 
        self.albums = albums
        self.albums_sold = albums_sold
        self.genre = genre 

    def print_stats(self):
        return 'band: {} members: {} albums: {} albums_sold: {} genre: {}'.format(self.band, self.members, self.albums, self.albums_sold, self.genre)

Queen = Band('Queen',4,15,105000000,'Rock')
print (Queen.print_stats())

# Second go at this with format so I didn't need to make 5 lines for five aspects 
# and I didn't need to put the values with the Band() object as defaults.
#
class Band(object):
    def __init__(self, band,members,albums,sold,genre):
        self.band = band
        self.members = members
        self.albums = albums
        self.albums_sold = sold
        self.genre = genre

    def print_stats(self):
        return 'band: {} members: {} albums: {} sold: {} genre: {}'.format(self.band, self.members, self.albums, self.sold, self.genre)

Queen = Band('Queen',4,15,105000000,'Rock')
print(Queen.print_stats())

AssertionError: 'band: Queen members: 4 albums: 15 albums_sold: 105000000 genre: Rock' 
             != 'band: Queen members: 4 albums: 15 sold: 105000000 genre: Rock' 
             - band: Queen members: 4 albums: 15 albums_sold: 105000000 genre: Rock ? ------- + band: Queen members: 4 albums: 15 sold: 105000000 genre: Rock

