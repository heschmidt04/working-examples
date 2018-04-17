# I was in a for loop = hammer and everything a nail mode earlier and this 
# made this exercise way harder than it had to be
# I wanted to fucking give up over the silliest of things... the hint was just
# making it hard for me. Use split and join and etc 
#
# This is my solution when I searched Google for replace string
#
# https://www.pythoncentral.io/pythons-string-replace-method-replacing-python-strings/

import string
def censor(text,word):
  text  = text.lower()
  word_len  = len(word)
  censored_string = string.replace(text, word, word_len * "*")
  return censored_string

print censor("why is this so hard tonight","hard")

#
#Theirs was also easier but it threw me because I was seeing a for loop for every answer
#
def ca_censor(text, word):
  a = "*" * len(word)
  for c in text:
    nw = text.split(word)
  return a.join(nw)

print ca_censor("when tired DO not code!","DO")

