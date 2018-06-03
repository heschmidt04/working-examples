grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def print_grades(grades_input):
  for grade in grades_input:
    print grade

print print_grades(grades)

# Notes: return only returns the first value 
# -- print returns each on a new line without a '\n'
# When using print print_grades(grades) I get an extra None... 
#
# Is there a cleaner way to have it a
#
#
grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

# this is dumb as rocks stupid... no one says the class has a 1045.5 grade 
def grades_sum(scores):
  total = 0
  for score in scores: 
    total += score
  return total

print grades_sum(grades)

#
# my working solution -- needs from __future__ import division 
#
from __future__ import division

grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def print_grades(grades_input):
  for grade in grades_input:
    print grade

def grades_sum(scores):
  total = 0
  for score in scores: 
    total += score
  return total
    
def grades_average(grades_input):
  sum_of_grades = grades_sum(grades_input)
  average = sum_of_grades / float(len(grades_input))
  return average

def grades_variance(scores):
  average = grades_average(scores)
  variance = 0
  number_of_scores = len(scores)
  for score in scores:
    #print average
    #print score
    variance += (average - score) ** 2
    total = variance / number_of_scores
  return total 
    
print grades_variance(grades) 
print grades_variance([6, 0, 2])

print grades_average(grades)
print grades_average([3, 5, 1, 6, 0, 6])

def grades_std_deviation(variance):
  return variance ** 0.5

variance = grades_variance(grades)
print grades_variance(grades)

# All put together to generate output 
print print_grades(grades)
print grades_sum(grades)
print grades_average(grades)
print grades_variance(grades)
print grades_std_deviation(variance)
