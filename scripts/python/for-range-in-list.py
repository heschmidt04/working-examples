n = [3, 5, 7]

def print_list(x):
  for i in range(0, len(x)):
    print x[i]
    
print_list(n)


n = [3, 5, 7]

def double_list(x):
  for i in range(0, len(n)):
      x[i] = x[i] * 2
  return x
# Don't forget to return your new list!

print double_list(n)

def my_function(x):
  for i in range(0, len(x)):
    x[i] = x[i]
  return x

print my_function(range(0,3)) # Add your range between the parentheses!
