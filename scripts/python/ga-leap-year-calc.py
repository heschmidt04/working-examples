def is_leap(n):
    if n % 400 == 0:
        return True
    elif n % 100 == 0 and n % 400 != 0:
        return False
    elif n % 4 == 0 and n % 100 != 0:
        return True
    else:
        return False
