# Question 1 
# ----------

# class MyCar
#   attr_accessor :speed

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
# end

# jocies_car = MyCar.new('2012', 'silver', 'Impreza')
# jocies_car.speed_up(10)
# jocies_car.speed_up(10)
# jocies_car.speed_up(30)
# jocies_car.slow_down(10)
# jocies_car.shut_off

# Question 2 
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
# end

# jocies_car = MyCar.new('2012', 'silver', 'Impreza')
# puts jocies_car.year
# puts jocies_car.color
# puts jocies_car.color = 'purple'
# puts jocies_car.color

# Question 3 
# ----------

class MyCar
  attr_accessor :speed, :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0 
  end

  def speed_up(number)
    self.speed += number
    puts "You are now driving at #{speed} mph."
  end

  def slow_down(number)
    self.speed -= number
    puts "You are now driving at #{speed} mph."
  end

  def shut_off
    self.speed = 0
    puts "You slowed to a stop."
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is being painted #{color}."
  end
end

jocies_car = MyCar.new('2012', 'silver', 'Impreza')
puts jocies_car.color
jocies_car.spray_paint('blue')
puts jocies_car.color
