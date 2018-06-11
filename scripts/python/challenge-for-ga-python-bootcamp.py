# Note, we will NOT be going through introductory Python. 
# Here is an example exercise you should be able to do before taking this class: 
# Write a function that prints all of the numbers between 1 and 10,000 
# that are either divisible by 7 or 33 but not both.
#
#  Notes: requires a modulus -- like a clock there are 12 modulus 0 - 12 

# for number in range(10001):
#     if number % 33 == 0:
#         print "This " + number + " is divisible by 33"
#     elif number % 7 == 0:
#         print "This " + number + " is divisible by 7"

# So I figured out what was happening with putting the range in the for loop with out assigning it to a variable
# the type(range(1)) is a string versus if put a = range(1) which then makes
# type(a[0]) an integer 
# >>> type(a[1])
# <type 'int'>
# >>> type(range(1))
# <type 'list'>
#

from __future__ import division
nrange = range(240)
for number in nrange:
    divby7 = False
    divby33 = False 
    if number % 7 == 0: 
        divby7 = True
#        print type(number)
        print 'Number is: ', number, ' Divided by 7 = ', number / 7
    if number % 33 == 0: 
        divby33 = True
#        print type(number)
        print 'Number is: ', number, ' Divided by 33 = ', number / 33 
#    else:
#        print number, 'Is just a number, not divisible by 7 or 33.'
    if (divby7 or divby33) and not (divby7 and divby33):
        print number, 'meets the condition'

