numberlist=[1,2,3,4,5,6,7,8,9]

def purify(numberlist):
    results =[]
    for number in numberlist:
        if number % 2 == 0:
            results.append(number)
    return results

print purify(numberlist)
