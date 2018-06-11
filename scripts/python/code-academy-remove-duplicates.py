
# This is list compreshension and I haven't figured out what it means yet
x = [1,2,3,4,5,6,7,8,9,10,2,1,6,31,20]

# Figure out seen and how it sets the default so that I can unpack it and repack it 
new_list = [seen.setdefault(x, x) for x in my_list if x not in seen]

#####################################
# This works 
def remove_duplicates(mylist):
  newlist = []
  for item in mylist:
    if item not in newlist:
      newlist.append(item)
  return newlist

mylist =[0,1,2,3,4,5,6,6,6,7,8,99,99,9,10,10,100,101]

remove_duplicates(mylist)


# My attempt at taking what works and putting it into list comprehension
#
#
newlist = [for item in mylist if item not in newlist]
