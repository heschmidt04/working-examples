x = 2

def is_even(x):
  if x % 2 > 1 or x % 2 == 0:
    print x 
    return True
  else:
    print x
    return False 

print is_even(2)
print is_even(4)
print is_even(1)
