# Define the function calc_default_add(), 
# which  when given two numeric inputs and the string "add" or "sub" 
#        either adds or subtracts the two numbers appropriately. 
# If the string is not provided as a third parameter, make the default operation add.
# 
# Also make sure that, if any other operation is provided as the third parameter, 
# you print the string "Valid operations: add, sub".
#
#
def calc_default_add(x, y, op=None):
    if op == None or op == 'add':
        return x + y
    elif op == 'sub':
        return x - y 
    else:
        print ("Valid operations: add, sub")


print calc_default_add(2, 4)
print calc_default_add(2, 4, 'sub')
print calc_default_add(2, 4, 'divide')


