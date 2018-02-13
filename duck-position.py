animals = ["aardvark", "badger", "duck", "emu", "fennec fox"]
duck_index = animals.index("duck")
# Use index() to find "duck"
print animals
# Your code here!
animals.insert(2,"cobra") # this is the position -- needs to inherit from the var duck_index


print animals # Observe what prints after the insert operation

animals = ["aardvark", "badger", "duck", "emu", "fennec fox"]
duck_index = animals.index("duck")# Use index() to find "duck"

# Your code here!
animals.insert(duck_index,"cobra")

print animals # Observe what prints after the insert operation
