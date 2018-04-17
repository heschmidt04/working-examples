import sys


def Cat(filename):
    f = open(filename, 'rU')
    lines = f.readlines()
    print lines
#    for line in f:
#        print line,
    f.close()

"""
The comma after line means no new line printed 
The new line is inhibited 
"""

# Cat('/Users/heidischmidt/Git/working-examples/small.txt')

def main():
    Cat(sys.argv[1])

# Standard boilerplate to call the main() function.
if __name__ == '__main__':
  main()
