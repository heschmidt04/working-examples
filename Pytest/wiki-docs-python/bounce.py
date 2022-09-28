# A rubber ball is dropped from a height of 100 meters
# Each time it hits the ground -
# it bounces up 3/5 of the height it fell
# Write a program that shows the height of the 1st ten bounces

height = 100 # Height in meters
counter = 0 # using a counter to increment to 10 iterations

while counter < 10:
    new_height = .6 * height
    height = new_height
    counter += 1
    print(round(height,4))

