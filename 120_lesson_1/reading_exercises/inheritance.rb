# -----------
# Question #1
# -----------

# class Vehicle
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

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def to_s
#     "This vehicle is the #{self.color} #{self.year} #{self.model}."
#   end
# end

# class MyCar < Vehicle
#   ROOF_RACK_COMPATIBLE = 'true'
# end

# class MyTruck < Vehicle
#   TRAILER_COMPATIBLE = 'true'
# end

# jocies_vehicle = MyCar.new('2012', 'silver', 'Impreza')
# nancys_vehicle = MyTruck.new('2015', 'red', 'F-150')

# puts jocies_vehicle
# puts nancys_vehicle








# -----------
# Question #2
# -----------

# class Vehicle
#   attr_accessor :speed, :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0 
#     @@number_of_vehicles += 1
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

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def to_s
#     "This vehicle is the #{self.color} #{self.year} #{self.model}."
#   end

#   def self.number_of_vehicles
#     @@number_of_vehicles
#   end
# end

# class MyCar < Vehicle
#   ROOF_RACK_COMPATIBLE = 'true'
# end

# class MyTruck < Vehicle
#   TRAILER_COMPATIBLE = 'true'
# end

# puts Vehicle.number_of_vehicles
# jocies_vehicle = MyCar.new('2012', 'silver', 'Impreza')
# puts Vehicle.number_of_vehicles
# nancys_vehicle = MyTruck.new('2015', 'red', 'F-150')
# puts Vehicle.number_of_vehicles

# puts jocies_vehicle
# puts nancys_vehicle





# -----------
# Question #3
# -----------

# module Towable
#   def tow
#     "I can tow up to 10,000 lbs."
#   end
# end

# class Vehicle
#   attr_accessor :speed, :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0 
#     @@number_of_vehicles += 1
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

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def to_s
#     "This vehicle is the #{self.color} #{self.year} #{self.model}."
#   end

#   def self.number_of_vehicles
#     @@number_of_vehicles
#   end
# end

# class MyCar < Vehicle
#   ROOF_RACK_COMPATIBLE = 'true'
# end

# class MyTruck < Vehicle
#   include Towable 
#   TRAILER_COMPATIBLE = 'true'
# end

# jocies_vehicle = MyCar.new('2012', 'silver', 'Impreza')
# nancys_vehicle = MyTruck.new('2015', 'red', 'F-150')

# puts nancys_vehicle.tow








# -----------
# Question #4
# -----------

# module Towable
#   def tow
#     "I can tow up to 10,000 lbs."
#   end
# end

# class Vehicle
#   attr_accessor :speed, :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0 
#     @@number_of_vehicles += 1
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

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def to_s
#     "This vehicle is the #{self.color} #{self.year} #{self.model}."
#   end

#   def self.number_of_vehicles
#     @@number_of_vehicles
#   end
# end

# class MyCar < Vehicle
#   ROOF_RACK_COMPATIBLE = 'true'
# end

# class MyTruck < Vehicle
#   include Towable 
#   TRAILER_COMPATIBLE = 'true'
# end

# puts "---MyCar Method Lookup---"
# puts MyCar.ancestors
# puts ''

# puts "---MyTruck Method Lookup---"
# puts MyTruck.ancestors
# puts ''

# puts "---Vehicle Method Lookup---"
# puts Vehicle.ancestors
# puts ''







# -----------
# Question #5
# -----------

# Already completed.








# -----------
# Question #6
# -----------

# module Towable
#   def tow
#     "I can tow up to 10,000 lbs."
#   end
# end

# class Vehicle
#   attr_accessor :speed, :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0 
#     @@number_of_vehicles += 1
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

#   def self.miles_per_gallon(total_distance, total_gallons)
#     mpg = total_distance.to_i / total_gallons.to_i
#     puts "#{mpg} mpg"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your car is being painted #{color}."
#   end

#   def to_s
#     "This vehicle is the #{self.color} #{self.year} #{self.model}."
#   end

#   def self.number_of_vehicles
#     @@number_of_vehicles
#   end

#   def age
#     "The #{model} is #{years_old} years old."
#   end

#   private

#   def years_old
#     (Time.now.year) - self.year.to_i
#   end

# end

# class MyCar < Vehicle
#   ROOF_RACK_COMPATIBLE = 'true'
# end

# class MyTruck < Vehicle
#   include Towable 
#   TRAILER_COMPATIBLE = 'true'
# end

# jocies_vehicle = MyCar.new('2012', 'silver', 'Impreza')
# nancys_vehicle = MyTruck.new('2015', 'red', 'F-150')

# puts jocies_vehicle.age
# puts jocies_vehicle.years_old







# -----------
# Question #7
# -----------

# class Student
#   attr_accessor :name

#   def initialize(name, grade)
#     self.name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#      grade > other_student.grade
#   end

#   protected

#   def grade
#     @grade
#   end
# end

# bob = Student.new("Bob", "60")
# joe = Student.new("Joe", "90")
# puts "Well done!" if joe.better_grade_than?(bob)






# -----------
# Question #8
# -----------

class Person

  def greeting
    puts "#{hi}, what is your name? "
  end

  private

  def hi
    "Hi"
  end

end

bob = Person.new
bob.greeting

# The issue is that the hi method is a private method to the Person class and not available outside of the Person class. To fix the error, we need to either make the 'hi' method public by moving it above the reserved word 'private' OR create another method within the Person class that calls the 'hi' method. If we do the latter, then the new method must be called outside by the object.





