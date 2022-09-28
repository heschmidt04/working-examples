# mortgage_extra.py

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
    #elif  principal < payment:
    #    total_paid = total_paid + principal  # last payment should be less than payment
    #    principal = 0
    else:
        principal = principal * (1 + rate / 12) - payment
        total_paid = total_paid + payment
    print(month, round(total_paid, 2), round(principal, 2))

print('Total paid', total_paid)