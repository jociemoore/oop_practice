# ------------
# Fix the Program - Mailable
# ------------

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

# ------------
# Fix the Program - Drivable
# ------------

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# ------------
# Complete the Program - Houses
# ------------

# class House
#   attr_reader :price
#   include Comparable

#   def initialize(price)
#     @price = price
#   end

#   def <=>(value)
#      price <=> value.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# # Home 1 is cheaper
# # Home 2 is more expensive

# # FURTHER RESEARCH: http://docs.ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html

# # -------------------
# # Further Exploration
# # -------------------

# # I am not sure if this is what the question is getting at, but perhaps using Comparable in this case is not the best choice because on its own is not greater or less than another. You have to be more specific as you could be comparing price, height, conditions, square feet, etc. Therefore this use is not intuitive. Alternatively, using Comparable is perhaps a better decision in classes like Score or Income. 

# ------------
# Reverse Engineering
# ------------

# class Transform
#   def initialize(string)
#     @string = string
#   end

#   def uppercase
#     @string.upcase
#   end

#   def self.lowercase(str)
#     str.downcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

# # ABC
# # xyz

# ------------
# What Will This Do?
# ------------

# class Something
#   def initialize
#     @data = 'Hello'
#   end
  
#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata
# puts thing.dupdata

# => ByeBye
# => HelloHello

# ------------
# Comparing Wallets
# ------------

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     @amount <=> other_wallet.amount
#   end

#   protected

#   def amount
#     @amount
#   end
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# -------------------
# Further Exploration
# -------------------

# => Applications where protected methods would be desirable might be income statistics or test placement among classmates.  

# ------------
# Pet Shelter
# ------------

# class Pet
#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
# end

# class Owner
#   attr_reader :name
#   attr_accessor :number_of_pets

#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end
# end

# class Shelter
#   attr_reader :total_shelter_pets

#   def initialize
#     @adoption_record = {}
#     @total_shelter_pets = 0
#     @pets = []
#   end

#   def add_pet(pet)
#     @pets << pet
#     @total_shelter_pets += 1
#   end

#   def adopt(owner, pet)
#     experienced_owner = @adoption_record.key?(owner) 
#     experienced_owner ? @adoption_record[owner] << pet :
#                         @adoption_record[owner] = [pet]
#     owner.number_of_pets += 1
#   end

#   def print_unadopted_pets
#     puts
#     puts "The Animal shelter has the following unadopted pets:"
#     @pets.each do |pet|
#       puts "a #{pet.type} named #{pet.name}"
#     end
#   end

#   def print_adoptions
#     @adoption_record.each do |owner, pets|
#       puts
#       puts "#{owner.name} has adopted the following pets:"
#       pets.each do |pet|
#         puts "a #{pet.type} named #{pet.name}"
#       end
#     end
#   end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
# asta         = Pet.new('dog', 'Asta')
# laddie       = Pet.new('dog', 'Laddie')
# fluffy       = Pet.new('cat', 'Fluffy')
# kat          = Pet.new('cat', 'Kat')
# ben          = Pet.new('cat', 'Ben')
# chatterbox   = Pet.new('parakeet', 'Chatterbox')
# bluebell     = Pet.new('parakeet', 'Bluebell')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.add_pet(asta)
# shelter.add_pet(fluffy)
# shelter.add_pet(kat)
# shelter.add_pet(ben)
# shelter.add_pet(chatterbox)
# shelter.add_pet(bluebell)
# shelter.print_unadopted_pets
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# puts "The Animal shelter has #{shelter.total_shelter_pets} unadopted pets."

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.

# => Code Design Critique:
# => => have methods do one thing
# => => you are not limited to the methods called in the implementation
# => => shouldn't the owner have a way to keep track all his/her pets?

# ------------
# Fix the Program - Expander
# ------------

# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     self.expand(3)
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander

# => The issue with this code is that the to_s method is calling a class method called expand with one argument but the expand method in Expander is an instance method not a class method. It seems silly to have class method be private so I would probably fix this code by removing the self before the method call in the to_s method.

# ------------------
# Moving & Nobility
# ------------------

# module Walkable
#   def walk
#     puts "#{who_moves} #{gait} forward"
#   end
# end

# class Noble
#   include Walkable
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   private

#   def gait
#     "struts"
#   end

#   def who_moves
#     "#{title} #{name}"
#   end

# end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end

#   def who_moves
#     "#{name}"
#   end
# end


# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end

#   def who_moves
#     "#{name}"
#   end
# end

# class Cheetah
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end

#   def who_moves
#     "#{name}"
#   end
# end

# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

# byron = Noble.new("Byron", "Lord")
# byron.walk
# # => "Lord Byron struts forward"


# -------------------
# Further Exploration
# -------------------

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    puts "#{who_moves} #{gait} forward"
  end

  private

  def gait
    "strolls"
  end

  def who_moves
    "#{name}"
  end

end


class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    puts "#{who_moves} #{gait} forward"
  end

  private

  def gait
    "saunters"
  end

  def who_moves
    "#{name}"
  end
end

class Cheetah < Cat
  attr_reader :name

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    @title = title
    super(name)
  end

  private

  def gait
    "struts"
  end

  def who_moves
    "#{title} #{name}"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"



# It might be better to create a different 'name' or 'fullname' method other than the to_s method if you needed the to_s to print some other information other than the name, but then you would have to call it more exlicitly. 