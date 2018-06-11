import calendar 
# In the Gregorian calendar, three criteria must be taken into account to identify leap years:

# If the year can be evenly divided by 400, it is a leap year.
# If the year can be divided by 100 and not 400, it is not a leap year.
# If the year can be divided by 4 but not by 100, it is a leap year.

def is_leap(year):
    check_year=calendar.isleap(year) 
    if check_year == True: 
        return "The year " + str(year) + " is a leap year"
    elif check_year == False:
        return "The year " + str(year) + " is not a leap year, leap years occur every 4 years"


print is_leap(2009)
print is_leap(1972)
print is_leap(2020)

def long_is_leap(n):
    if n % 400 == 0: 
        return str(n) + " is a leap year"
    elif n % 100 == 0 and n % 400 != 0: 
        return str(n) + " is NOT a leap year"
    elif n % 4 == 0 and n % 100 != 0:
        return str(n) + " is a leap year"
    else:
        return str(n) + " is NOT a leap year"

print long_is_leap(2009)
print long_is_leap(1972)
print long_is_leap(2020)

