def reverse(letters):
    txt = ""
    for char in letters:
        txt = char + txt
        print txt
    return txt
   

print reverse('Python!')
