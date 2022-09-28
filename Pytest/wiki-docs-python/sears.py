# Source exercise - https://wikidocs.net/82402
# Sears Tower - one morning you go out and place a dollar bill on the sidewalk by the Sears tower
# Each day you dble the number of bills
# How long does it take for the stack of bills to exceed the height of the tower?

# Variables
bill_thickness = 0.11 * 0.001 # Value in meters (.0.11)
sears_height = 442 # Height in meters
num_bills = 1
day = 1


while num_bills * bill_thickness < sears_height:
    print(day, num_bills, num_bills * bill_thickness)
    day += 1
    num_bills = num_bills * 2

print(f'Number of days {day}')
print(f'Number of bills {num_bills}')
print(f'Final height {num_bills * bill_thickness}')
