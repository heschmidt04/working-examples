def hotel_cost(nights):
  return 140 * nights 

hotel_cost(4)

def plane_ride_cost(city):
  if city == "Charlotte":
    return 183
  elif city == "Tampa":
    return 220
  elif city == "Pittsburgh":
    return 222
  elif city == "Los Angeles":
    return 475 
  
# def rental_car_cost(days):
#   rental = 40 * days
#   if days >= 7:
#     return rental - 50
#   elif days >= 3:
#     return rental - 20 

def rental_car_cost(days):
  cost = days * 40
  if days >= 7:
    cost -= 50
  elif days >= 3:
    cost -= 20
  return cost



print plane_ride_cost("Los Angeles")

print rental_car_cost(8)
print rental_car_cost(4)

