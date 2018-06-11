sequence =[1,1,1,1,1,2,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4]
item=4
def count(sequence,item):
  sum = 0 
  for x in sequence:
    if x == item:
      sum = sum + 1
  
  return sum 


# This one is interesting for list comprehension for counting how many 
# repeats of an item in the sequence for each grouping 

a = [1,1,1,1,2,2,2,2,3,3,4,5,5]
d = {x:a.count(x) for x in a}
print d
# {1: 4, 2: 4, 3: 2, 4: 1, 5: 2}
a, b = d.keys(), d.values()
print a
# [1, 2, 3, 4, 5]
print b
#[4, 4, 2, 1, 2]

