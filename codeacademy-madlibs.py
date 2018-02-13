# This program is to print a silly Madlibs story based on the persons input 

print "Madlibs has started!"

main_character = raw_input('Please enter a name:')

print "We need you to put in three adjectives and three verbs so hold on for questions"
adjective_one = raw_input('Please enter an adjective:')
adjective_two = raw_input('Please enter a second adjective:')
adjective_three = raw_input('Please enter the third adjective:')

verb_one = raw_input('Please enter a verb:')
verb_two = raw_input('Please enter a second verb:')
verb_three = raw_input('Please enter the third verb:')

print "Now we need four nouns for the Madlibs story"

noun_one = raw_input('Please enter a noun:')
noun_two = raw_input('Please enter a second noun:')
noun_three = raw_input('Please enter a third noun:')
noun_four = raw_input('Please enter the fourth noun:')

print "Now we get to get really silly. Can you come up with imaginative ideas for the following?"

animal = raw_input('Please enter your favorite animal:')
food = raw_input('Please enter a funky food:')
fruit = raw_input('Please enter a fruit you like to eat:')
number = raw_input('Pick a number, any number:')
superhero = raw_input('Please enter your favorite superhero or superheroine:')
country = raw_input('Please enter a country you have travelled to or want to travel to:')
dessert = raw_input('Please enter your favorite dessert food:')
year = raw_input('Think of a year you would like to time travel to:')



#The template for the story
STORY = "This morning I woke up and felt %s because %s was going to finally %s over the big %s %s. On the other side of the %s were many %s s protesting to keep %s in stores. The crowd began to %s to the rhythm of the %s, which made all of the %s s very %s. %s tried to %s into the sewers and found %s rats. Needing help, %s quickly called %s. %s appeared and saved %s by flying to %s and dropping %s into a puddle of %s. %s then fell asleep and woke up in the year %s, in a world where %s s ruled the world."

print STORY % (adjective_one, main_character, verb_one, adjective_two, noun_one, noun_two, animal, food, verb_two, noun_three, fruit, adjective_three, main_character, verb_three, number, main_character, superhero, superhero, main_character, country, main_character, dessert, main_character, year, noun_four)
