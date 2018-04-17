# n.pop(index) will remove the item at index from the list and return it to you:

n = [1, 3, 5]
n.pop(1)
# Returns 3 (the item at index 1)
print n
# prints [1, 5]

# n.remove(item) will remove the actual item if it finds it:

n.remove(1)
# Removes 1 from the list,
# NOT the item at index 1
print n
# prints [3, 5]
# del(n[1]) is like .pop in that it will remove the item at the given index, but it won't return it:

del(n[1])
# Doesn't return anything
print n
# prints [1, 5]
#

## def list_function_too(x):
##     return x
##     if x[1] == 5:
##       x[1] = 55
##       return x
## 
## y = [3, 5, 100, 14, 7]
## print list_function_too(y)

def list_function_too(x):
#  return x
    if x[1] == 5:
      print "the logic is here"
      x[1] = x[1] - 5
      return x[1]
    return x

y = [3, 5, 100, 14, 7]
print list_function_too(y)

def list_function(x):
  x[1] = x[1] + 3
  return x

n = [3, 5, 7]
print list_function(n)
