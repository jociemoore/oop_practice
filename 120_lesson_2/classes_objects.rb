# -----------
# Question #1
# -----------

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# p bob.name
# bob.name = 'Robert'
# p bob.name


# -----------
# Question #2
# -----------


# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_name, last_name='')
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def name
#     if last_name != ''
#       "#{first_name} #{last_name}"
#     else 
#       "#{first_name}"
#     end
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'


# -----------
# Question #3
# -----------

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(name)
#     parts = name.split
#     self.first_name = parts.first
#     self.last_name = parts.size > 1 ? parts.last : ''
#   end
# end


# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'
 
# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'


# -----------
# Question #4
# -----------

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# p bob.name == rob.name

# -----------
# Question #5
# -----------

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parts = name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end
end


bob = Person.new("Robert Smith") 
puts "The person's name is: #{bob}"

# => The above code prints out "The person's name is: #<Person:0x007fab8c030468>"

# => The above code prints out "The person's name is: Robert Smith>"

