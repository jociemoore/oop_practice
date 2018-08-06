# -------------
# Question #1
# -------------

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class BullDog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = BullDog.new
# puts teddy.speak
# puts teddy.swim

# -------------
# Question #2
# -------------

# class Animal
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end
# end

# class Cat < Animal
#   def speak
#     'meow!'
#   end
# end

# class Dog < Animal
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# class BullDog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new

# puts 'teddy'
# puts teddy.speak
# puts teddy.swim
# puts teddy.fetch
# puts "-------"

# karl = BullDog.new

# puts 'karl'
# puts karl.speak
# puts karl.swim
# puts karl.fetch
# puts "-------"

# sam = Cat.new

# puts 'sam'
# puts sam.speak
# puts sam.jump
# puts "-------"


# -------------
# Question #3
# -------------

#           -------------
#           |   Animal  |
#           |   * Run   |
#           |   * Jump  |
#           -------------
#  -------------     -------------
#  |    Dog    |     |    Cat    |
#  |   * Speak |     |   * Speak |
#  |   * Swim  |     -------------
#  |   * Fetch |
#  ------------     
#  -------------
#  |  BullDog  |
#  | * No Swim |
#  -------------



# -------------
# Question #4
# -------------

# The method lookup path is the path that the Ruby follows when looking for the method being called on an object. The method lookup path is an important concept to know for understanding class inheritance, overriding class methods when necessary, and not overriding key class methods by accident -- only the first method that matches the method called will be used. You can use the ancestors method in order to see the lookup chain. 
