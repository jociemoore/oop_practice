# ------------
# Question #1
# ------------

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# p oracle.predict_the_future

# The code above will output nothing because you need to pring the output of oracle.predict_the_future. If you do, it will print one of the following randomly:
# You will eat a nice lunch.
# You will take a nap soon.
# You will stay at work late.

# ------------
# Question #2
# ------------

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# p trip.predict_the_future

# The above code will print one of the following randomly:
# You will visit Vegas.
# You will fly to Fiji.
# You will romp in Rome.

# ------------
# Question #3
# ------------

# To find where Ruby will look for a method you call or an objects ancestors use .ancestors on a class.

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# p Orange.ancestors
# puts "----"
# p HotSauce.ancestors

# ------------
# Question #4
# ------------

# class BeesWax
#   attr_accessor :type

#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end

# ------------
# Question #5
# ------------

# excited_dog = "excited dog" # local variable
# @excited_dog = "excited dog" # instance variable
# @@excited_dog = "excited dog" # class variable

# I can distinguish the type of variable by counting the number of @ symbols that are at the beginning of the name.

# ------------
# Question #6
# ------------

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# self.manufacturer is a class method and I can tell by the self prefix. To call it I would use Television.manufacturer.

# ------------
# Question #7
# ------------

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# The @@cats_count is a class variable and it keeps track of the number of instances of the Cat class. Anytime the an instance of the Cat class is initialized the @@cats_count variable is incremented by one. 

# p Cat.cats_count
# Cat.new('bobcat')
# p Cat.cats_count

# ------------
# Question #8
# ------------

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end

# board_game = Bingo.new
# p board_game.play

# ------------
# Question #9
# ------------

# If a play method was added to the Bingo class in the code above, that method would be called instead of the play method in the Game class. Ruby will first look for a method in the class that called it and then proceed to look up the method lookup path until it finds a match.

# ------------
# Question #10
# ------------

# Benefits of using OOP in Ruby:
# Deals well with complex programs
# Easier to maintain -- prevents the ripple effect of making changes
# Data protection
# Flexible -- can use pre-written code for many purposes
# "DRY-er"
