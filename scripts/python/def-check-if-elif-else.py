def greater_less_equal_5(answer):
    if answer > 5:
        return 1
    elif answer < 5:          
        return -1
    else:
        return 0
        
print greater_less_equal_5(4)
print greater_less_equal_5(5)
print greater_less_equal_5(6)

# Make sure that the_flying_circus() returns True
def the_flying_circus():
    if 5>4 and 4 > 3:    # Start coding here!
        # Don't forget to indent
        # the code inside this block!
        return True
    elif 3==3:
        # Keep going here.
        return False
        # You'll want to add the else statement, too

    else:
      return False
