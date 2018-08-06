# -----------
# Question #1
# -----------

# All four options are opjects, and you can find what class they belong to by calling the class method on them. (ex. 142.class)



# -----------
# Question #2
# -----------

# Include the Speed module in each class using the reserved keyword 'include'. To test if Car and Truck can go fast create a new instance of the either class and then call the go_fast method on it.

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed

#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Car.new.go_fast
# Truck.new.go_fast



# -----------
# Question #3
# -----------

# The go_fast method includes the name of the type of vehicle because it uses variable interpolation to call the class method on self, which in this case would be the new instance of the Car class.

# -----------
# Question #4
# -----------

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# sam = AngryCat.new

# -----------
# Question #5
# -----------

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# The Pizza class has an instance variable and I know because instance variables start with one @.


# -----------
# Question #6
# -----------

# attr_accessor -- which adds getter and setter methods and we could use by calling .volume on any instance of the Cube class.

# class Cube
#   attr_accessor :volume
#   def initialize(volume)
#     @volume = volume
#   end
# end


# -----------
# Question #7
# -----------

# Calling to_s on an object prints the class and an encoding of the object id. I checked Ruby Docs.

# -----------
# Question #8
# -----------

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# In the case of the make_one_year_older method, self refers to an instance on the Cat class that called it (which doesn't exist yet).

# -----------
# Question #9
# -----------

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

# In the name of the cats_count method, self refers to the Cat class itself.


# -----------
# Question #10
# -----------

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# call the new method to create a new instance of the Bag class

Bag.new('red', 'leather')





