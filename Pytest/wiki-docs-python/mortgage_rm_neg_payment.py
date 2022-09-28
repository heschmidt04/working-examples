# 338 919229.18 8684.87
# 339 921913.29 6036.95
# 340 924597.4 3377.99
# 341 927281.51 707.95
# 342 929965.62 -1973.21
# Total paid 929965.6199999959


# Mortgage extra python script does the right thing
# Then when removing last payment the numbers don't line up

principal = 500000.0
rate = 0.05
payment = 2684.11
extra_payment = 1000.0
total_paid = 0.0
month = 0

while principal > 0:
    month += 1
    if month <=12:
        principal = principal * (1+rate/12) - (payment + extra_payment)
        total_paid = total_paid + payment + extra_payment
    elif principal < payment:
        total_paid = total_paid + principal  # last payment should be less than payment
        principal = 0
    else:
        principal = principal * (1 + rate / 12) - payment
        total_paid = total_paid + payment
    print(month, round(total_paid, 2), round(principal, 2))

print('Total paid', total_paid)
# 340 924597.4 3377.99
# 341 927281.51 707.95
# 342 927989.46 0
# Total paid 927989.4644649613

#
