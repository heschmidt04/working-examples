# Challenge 3: Multiples of 3 and 5
# If we list all of the natural numbers below 10 
# that are multiples of 3 or 5, we get 3, 5, 6, and 9. 
# The sum of these multiples is 23. 
# Find the sum of all the multiples of 3 and 5 below 1,000. 
# Afterward, write a brief explanation walking through your code's logic in markdown.
#

# https://projecteuler.net/index.php?section=problems&id=1
# https://stackoverflow.com/questions/5930300/how-to-find-the-sum-of-all-the-multiples-of-3-or-5-below-1000-in-python?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

nums = [3, 5]
max = 1000

result = 0
for num in nums:
    for i in range(1,max):
        if num*i < max:
            result += num*i
print result


result = 0
for i in range(0,max):
    if i%3 == 0 or i%5 == 0:
        result += i

print result

# with list compression 
sum([i for i in range(1000) if i % 3 == 0 or i % 5 == 0])
