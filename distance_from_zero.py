def distance_from_zero(d):
  if type(d) == int or type(d) == float: 
     print abs(d)
  else: 
   return "Nope"

distance_from_zero(10)
distance_from_zero(10.5)
distance_from_zero('hello')

# def distance_from_zero(num):
#   if type(num) == int or type(num) == float:
#     return abs(num)
#   else:
#     return "Nope"

