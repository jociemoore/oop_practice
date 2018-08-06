# ------------------------
# Banner Class
# ------------------------

# class Banner
#   def initialize(message, width=nil)
#     @message = message
#     @size = @message.size
#     @width = width ? adjust_width(width) : @size
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def adjust_width(width)
#     @width = width.odd? ? width + 1 : width
#   end

#   def horizontal_rule
#     "+-#{'-' * @width}-+"
#   end

#   def empty_line
#     "| #{' ' * @width} |"
#   end

#   def message_line
#     part1 = @message[0, @width]
#     part2 = @message[@width, (@size - part1.size)]
#     last_line_padding = (@width - part2.size) / 2
#     padding = (@width - @size) / 2

#     if @width < @size
#       "| #{part1} |\n| #{' ' * (last_line_padding)}#{part2}#{' ' * (last_line_padding)} |"
#     elsif @width > @size
#       "| #{' ' * (padding)}#{@message}#{' ' * (padding)} |"
#     else
#       "| #{@message} |"
#     end
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.', 32)
# puts banner

# banner = Banner.new('')
# puts banner

# ------------------------
# What's the Output?
# ------------------------

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name # => Fluffy
# puts fluffy # => My name is FLUFFY. 
# puts fluffy.name # => FLUFFY
# puts name # => FLUFFLY

# -------------------
# Further Exploration
# -------------------

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name # => '42'
# puts fluffy # => 'My name is 42.'
# puts fluffy.name # '42'
# puts name # => 43

# Instance variable @name equals the string object '42'. Local variable name equals the fixnum object 42. Each point to their own object, and therefore when name is reassigned the value of 43, @name does not get reassigned a new value.

# ------------------------
# Fix the Program - Books (Part 1)
# ------------------------

# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# # => The author of "Snow Crash" is Neil Stephenson.
# # => book = "Snow Crash", by Neil Stephenson.

# -------------------
# Further Exploration
# -------------------

# attr_reader is used to do the same thing as a getter method: allow the ability to retrieve the value in an instance variable from inside or outside the class. attr_write is used to do the same things as setter method: allow the ability to reassign the value of an instance variable from inside or outside the class. attr_accessor is a uber shorthand for doing the same as both a getter and setter method. 

# In this case you could not use attr_writer because the puts method is specifically trying to read the value in the instance variable. You could use attr_accessor, but then you are also giving the ability to reassign the value of the instance variable from anywhere.

# Using actual getter methods should not change the behavior of the class in any way because as mentioned before this is exactly what is behind the scenes of Ruby's syntactical sugar with attr_reader. One potential advantage of using getter methods is that you can still make them private with the private keyword and in this way the values in the instance varialbes will not be readable outside the class.

# ------------------------
# Fix the Program - Books (Part 2)
# ------------------------

# class Book
#   attr_accessor :title, :author

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# # => The author of "Snow Crash" is Neil Stephenson.
# # => book = "Snow Crash", by Neil Stephenson.

# -------------------
# Further Exploration
# -------------------

# This way of initializing Book objects is a little less intuitive I think. If the point of OOP is to encapsulate related methods and variables to one spot, this seesm to defeat that objective. The instance variables can be accessed publically (an initialize method is always private) and the code for the Book class is all over the place -- or at least I imagine it could be if you had a larger program. 

# ------------------------
# Fix the Program - Persons
# ------------------------

# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def first_name=(value)
#     @first_name = value.capitalize
#   end

#   def last_name=(value)
#     @last_name = value.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# # John Doe
# # Jane Smith

# ------------------------
# Fix the Program - Flight Data
# ------------------------

# class Flight
#   # attr_accessor :database_handle

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# => With the attr_accessor, you are making the @database_handle instance variable accessible and therefore opening the door for dependencies. Once someone else's code depends on yours here, it might be hard to extract the :database_handle if you no longer want to use it.

# ------------------------
# Buggy Code - Car Mileage
# ------------------------

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678


# ------------------------
# Rectangles and Squares
# ------------------------

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(side_length)
#     super(side_length, side_length)
#   end

# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# ------------
# Complete the Progam - Cat!
# ------------

# class Pet
#   def initialize(name, age, color)
#     @name = name
#     @age = age
#     @color = color
#   end
# end

# class Cat < Pet
#   def to_s
#     "My cat #{@name} is #{@age} years olf and has #{@color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# # My cat Pudding is 7 years old and has black and white fur.
# # My cat Butterscotch is 10 years old and has tan and white fur.

# I am able to omit an initialize method from the Cat class by modifying the Pet class to accept a color parameter because the Cat class can inherit the entire method from the Pet class. It there were other instances of the Pet class in this program, I would either need to update the instantiation of each object to include a color argument for each OR make the color parameter optional by providing a default value.

# ------------
# Refactoring Vehicles
# ------------

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels(num)
    num
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    super(4)
  end
end

class Motorcycle < Vehicle
  def wheels
    super(2)
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    super(6)
  end
end

# Semantically, I think it does make sense to include wheels in the Vehicle class (unless we are counting boats as vehicles). 
