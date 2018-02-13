# Remember that in a for item in list - refer to the item in comparison NOT the list 
#
#Requirements are to 
# - write a function called fizz_count that takes a list x as input
# - create a variable count to hold the ongoing COUNT (start at 0) 
# - for each item in x, if that item is equal to the string "fizz" then increment the count variable 

# Write your function below!
def fizz_count(x):
  count = 0
  for item in x:
    if item == "fizz":
      count = count + 1
  return count

  fizz_count(["fizz","fizzy","fuzz","fizz"])
