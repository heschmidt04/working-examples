lloyd = {
  "name": "Lloyd",
  "homework": [90.0, 97.0, 75.0, 92.0],
  "quizzes": [88.0, 40.0, 94.0],
  "tests": [75.0, 90.0]
}
alice = {
  "name": "Alice",
  "homework": [100.0, 92.0, 98.0, 100.0],
  "quizzes": [82.0, 83.0, 91.0],
  "tests": [89.0, 97.0]
}
tyler = {
  "name": "Tyler",
  "homework": [0.0, 87.0, 75.0, 22.0],
  "quizzes": [0.0, 75.0, 78.0],
  "tests": [100.0, 100.0]
}


students = [lloyd, alice, tyler]
for student in students:
  print "name: %s" % student['name']
  print "homework: %s" % student['homework']
  print "quizzes: %s" % student['quizzes']
  print "tests: %s" % student['tests']
  print "------------"


def average(numbers):
  total = sum(numbers)
  total = float(total)
  return "The total is: " + total / len(numbers)

def get_average(student):
  homework = average(student['homework']) 
  quizes = average(student['quizzes']) 
  tests = average(student['tests']) 
  total = homework * .10 + quizzes * .30 + tests * .60
  return total
  print "The total average for each student is:" + total



def average(numbers):
  total = sum(numbers)
  total = float(total)
  return total / len(numbers)
  print total / len(numbers)

def get_average(student):
  homework = average(student["homework"])
  quizzes = average(student["quizzes"])
  tests = average(student["tests"])

  total = homework *.1 + quizzes * .3 + tests * .6
  return total
  print "These are the avg numbers for:" + total 

def get_letter_grade(score):
  if score >= 90:
    return "A"
  elif score >= 80:
    return "B"
  elif score >= 70:
    return "C"
  elif score >= 60:
    return "D"
  else: 
      return "F"
  
print "Getting letter grade for LLoyd: " + get_letter_grade(get_average(lloyd))

def get_class_average(class_list):
  results = []
  for student in class_list:
    student_avg = get_average(student)
    results.append(student_avg)
  return average(results)

print "Getting letter avg for LLoyd: " + get_letter_grade(get_average(lloyd))
print "Getting the class avg for all students: " + str(get_class_average(students))
print "Getting letter grade for every students average grade: " + str(get_letter_grade(get_class_average(students)))
