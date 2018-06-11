def is_int(x):
  absolute = abs(x)
  rounded = round(absolute)
  print absolute 
  print rounded
  diff = absolute - rounded
  print diff 
  return absolute - rounded == 0

print is_int(8)
print is_int(-1)
print is_int(7.0)
print is_int(4.4) 
