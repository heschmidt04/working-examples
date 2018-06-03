from __future__ import division

def median(lst):
    n = len(lst)
    print n 
    if n < 1:
            return None
    if n % 2 == 1:
            return float(sorted(lst)[n//2])
#    else:
#            return float(sum(sorted(lst)[n//2-1:n//2+1])/2.0)
#            return 'I need to unpack this less as I am not sure which piece is evaluating where and what'

# lst = [1, -4, -1, -1, 1, -3]
# lst = [13, 23, 11, 16, 15, 10, 26]
lst = [1.0, 3.5, 4.0, 9.0, 2.7]
print median(lst)


# Solution for code academy is much longer
#
#
def median(lst):
    sorted_list = sorted(lst)
    if len(sorted_list) % 2 != 0:
        #odd number of elements
        index = len(sorted_list)//2 
        return sorted_list[index]
    elif len(sorted_list) % 2 == 0:
        #even no. of elements
        index_1 = len(sorted_list)/2 - 1
        index_2 = len(sorted_list)/2
        mean = (sorted_list[index_1] + sorted_list[index_2])/2.0
        return mean
   
print median([2, 4, 5, 9])
