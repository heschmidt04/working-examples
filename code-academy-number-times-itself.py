# This code takes the input and times each piece to get the final sum 
# eg: 1, 2, 3 will = 6
# eg 4,5,5 will = 100 
#
def product(lst):
  output = 1 
  for item in lst:
  	output *= item 
  return output 
