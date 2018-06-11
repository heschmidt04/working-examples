a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

for number in a:
  if number % 2 > 1 or number % 2 == 0 :
    print number 


for number in range(2,101):
    prime = True
    for i in range(2,number):
        if (number % i == 0):
            prime = False
    if prime:
       print number

def is_prime(x):
#  x = abs(x)
  if x < 2:
  	return False
  for number in range(2,x-1):
    if ( x % number == 0):
      return False

  return True

print is_prime(-7)
