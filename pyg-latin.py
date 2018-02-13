pyg = 'ay'

original = raw_input('Enter a word:')
print original 


if len(original) > 0 and original.isalpha():
  word = original.lower()
  first = word[0]
  new_word = word + first + pyg
  print word
  print first
  print new_word
else:
  print 'empty'
