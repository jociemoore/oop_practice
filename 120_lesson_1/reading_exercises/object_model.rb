# Question 1
# ----------

# Objects are created from Classes. In the example below, Jane is new object of the class Student.

# Question 2
# ----------
# Modules are used for data protection. Modules contain shared behaviors and must be mixed into a class by using the reserved word 'include'. In this way, the methods in the module can be shared amongst many classes. Modules can also contain classes, which means the classes only exist within that space and must be called accordingly.

module Write
  def write(answer)
    puts "#{answer}"
  end
end

class Student
  include Write
end

Jane = Student.new
Jane.write("2 + 2 equals 4")
