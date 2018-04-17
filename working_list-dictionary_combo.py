week_dict = {"Monday":False,"Tuesday":False,"Wednesday":False,"Thursday":False,"Friday":False,"Saturday":True,"Sunday":True}
weekdays = week_dict.keys()
del week_dict["Monday"]
weekdays.remove("Monday")
print week_dict
print weekdays

#  This puts a dictionary list and sets a list to the dictionary keys 
#  Then removing from the dictionary and from the list copy of keys the value of monday 
