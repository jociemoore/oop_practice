# ----------
# Question 1
# ----------

# class MyCar
#   attr_accessor :speed, :color
#   attr_reader :year

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0 
#   end

#   def speed_up(number)
#     self.speed += number
#     puts "You are now driving at #{speed} mph."
#   end

#   def slow_down(number)
#     self.speed -= number
#     puts "You are now driving at #{speed} mph."
#   end

#   def shut_off
#     self.speed = 0
#     puts "You slowed to a stop."
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def to_s

#   end

# end

# jocies_car = MyCar.new('2012', 'silver', 'Impreza')
# puts jocies_car

# puts MyCar.miles_per_gallon('300', '30')

# ----------
# Question 2
# ----------

# class MyCar
#   attr_accessor :speed, :color
#   attr_reader :year, :model

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0 
#   end

#   def speed_up(number)
#     self.speed += number
#     puts "You are now driving at #{speed} mph."
#   end

#   def slow_down(number)
#     self.speed -= number
#     puts "You are now driving at #{speed} mph."
#   end

#   def shut_off
#     self.speed = 0
#     puts "You slowed to a stop."
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def to_s
#     "This is the #{self.color} #{self.year} #{self.model}."
#   end

# end

# jocies_car = MyCar.new('2012', 'silver', 'Impreza')
# puts jocies_car

# ----------
# Question #3
# -----------

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
puts bob.name
bob.name = "Bob"
puts bob.name

# The error was occuring because we were using an attr_reader, which is equivalent to a getter method only. We need to use an attr_accessor, which is equivalent to both getter and setter methods, instead. This way we can overwrite the value stored in the instance variable @name. See above code for the fix.


