# ------------
# Question #1
# ------------

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# #1 --> prints "Hello"
# hello = Hello.new
# hello.hi

# #2 --> Error: No Method 'bye'
# hello = Hello.new
# hello.bye

# #3 --> Error: Wrong Number of Arguments
# hello = Hello.new
# hello.greet

# #4 --> prints "Goodbye"
# hello = Hello.new
# hello.greet("Goodbye")

# #5 --> Error: No Class Method 'hi'
# Hello.hi

# ------------
# Question #2
# ------------

# class Greeting
#   def self.greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def self.hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end


# Hello.hi


# ------------
# Question #3
# ------------

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# kitty = AngryCat.new(6, 'kitty')
# whiskers = AngryCat.new('9', 'whiskers')

# kitty.age
# whiskers.age


# ------------
# Question #4
# ------------

# class Cat
# attr_reader :type

#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     puts "I am a #{type} cat."
#   end
# end

# oreo = Cat.new('tabby')
# oreo.to_s


# ------------
# Question #5
# ------------

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer # --> Error: No Instance method 'manufacturer'
# tv.model # --> perform method logic

# Television.manufacturer # --> perform method logic
# Television.model # --> Error: No Class method 'model'

# ------------
# Question #6
# ------------

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

daisy = Cat.new('ragamuffin')
p daisy.make_one_year_older
p daisy.make_one_year_older

# ------------
# Question #7
# ------------

class Light
  # attr_accessor :brightness, :color --> This is not needed as these variables are not being used after initialization.
  # And "return" in the self.information method.

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
