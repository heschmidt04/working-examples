def cube(number):
  return number * number * number

def by_three(number):
  if number % 3 == 0:
    return cube(number)
  else:
    return False

print cube(4)

print by_three(3)
print by_three(0)
