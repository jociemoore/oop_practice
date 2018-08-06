# ------------
# Question #1
# ------------

# Ben is right. He is using an attr_reader, which sets up a getter method called balance behind the scenes. balance in the positive_balance? method calls the getter method and returns the @balance variable.

# ------------
# Question #2
# ------------

# Alyssa's mistake is that she is using an attr_reader, which only creates a getter method. Because she wants to change the value of the @quality variable, she needs to use an attr_accessor, which will create a getter and a setter method for @quality. When using an attr_accessor, Alyssa will also need to change quantity in the update_quantity method to self.quantity.

# ------------
# Question #3
# ------------

# The only thing I see potentially wrong is that its unneccessary to use attr_accessor on @product_name because it's value is not being changed anywhere. 

# ------------
# Question #4
# ------------

# class Greeting 
#   def greet(msg)
#     puts msg
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

# greeting1 = Hello.new
# greeting2 = Goodbye.new

# greeting1.hi
# greeting2.bye

# ------------
# Question #5
# ------------

# class KrispyKreme
#   attr_reader :filling_type, :glazing

#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     if filling_type && glazing
#       "#{filling_type} with #{glazing}"
#     elsif filling_type
#       filling_type
#     elsif glazing
#       "Plain with #{glazing}"
#     else
#       "Plain"
#     end
#   end

# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1 #=> "Plain"

# puts donut2 #=> "Vanilla"

# puts donut3 #=> "Plain with sugar"

# puts donut4 #=> "Plain with chocolate sprinkles"

# puts donut5 #=> "Custard with icing"


# ------------
# Question #6
# ------------

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

# In the above code, the @template is assigned a value directly in the create_template method (even though there are getter and setter methods for it). Additionally, the value of @template is retrieved using the getter method in show_template. 


# class Computer
#   attr_accessor :template

#   def create_template
#     self.template = "template 14231"
#   end

#   def show_template
#     self.template
#   end
# end


# In this code, the @template is assigned a value using the setter method. Secondly, the value of @template is retrieved using the getter method in show_template. 

# ------------
# Question #7
# ------------

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end
end


