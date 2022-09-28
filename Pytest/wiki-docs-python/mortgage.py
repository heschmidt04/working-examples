# Mortgage
# Dave has decieded to take out a 30 year mortgage fixed rate
# 500,000 with Guido's Mortgage
# Their interest rate is 52684.11

principal = 500000.0
rate = 0.05
payment = 2684.11
total_paid = 0.0
months_per_yr = 12.0
month = 0

extra_payment_start_month = 61
extra_payment_end_month = 108
extra_payment = 1000.0

while principal > 0:
    month += 1
    if principal < payment:
        total_paid = total_paid + principal  # last payment should be less than payment
        principal = 0
    else:
        principal = round(principal * (1 + rate / months_per_yr), 2) - payment
        total_paid = total_paid + payment

    if extra_payment_start_month <= month <= extra_payment_end_month:
        principal = principal - extra_payment
        total_paid = total_paid + extra_payment

    print(f"Month: {month}, Total paid: {round(total_paid, 2)}, Remaining principal: {round(principal, 2)}")
    # goal - When you run the new program, it should report a total payment of 929,965.62 over 342 months.

print(f"Total paid: {total_paid}")