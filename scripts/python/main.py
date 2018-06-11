#! /usr/bin/python -tt

import sys

def Hello(name):
#  if name == 'Heidi' or name == 'Nick':
  if len(name) > 0 and name.isalpha():
    name = name + '???'
    print 'Hello', name 
  else:
    name = name + '!!!!!!'
    print 'Hello', name

# Define a main() function that prints a little greeting
def main():
  Hello(sys.argv[1])

# This is the standard bolierplate that runs the main function
if __name__ == '__main__' :
    main()
  
