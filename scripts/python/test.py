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

