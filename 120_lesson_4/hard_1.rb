# ------------
# Question #1
# ------------

# class SecretFile
#   attr_accessor :log
#   attr_reader :data

#   def initialize(secret_data, log)
#     @data = secret_data
#     @log = log
#   end

#   def display_data
#     log.create_log_entry
#     puts data
#   end
# end

# class SecurityLogger
#   def create_log_entry
#     p @entry = Time.new
#   end
# end

# passwords = SecretFile.new('amazon: 12345', SecurityLogger.new)
# passwords.display_data

# ------------
# Question #2
# ------------

# module Fuelable
#   def fuel_specs(km_traveled_per_liter, liters_of_fuel_capacity)
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class WheeledVehicle
#   attr_accessor :speed, :heading

#   def tire_specs(tire_array)
#     @tires = tire_array
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end

# class Auto < WheeledVehicle
#   include Fuelable
#   def initialize
#     fuel_specs(50, 25.0)
#     # 4 tires are various tire pressures
#     tire_specs([30,30,32,32])
#   end
# end

# class Motorcycle < WheeledVehicle
#   include Fuelable
#   def initialize
#     fuel_specs(80, 8.0)
#     # 2 tires are various tire pressures
#     tire_specs([20,20])
#   end
# end

# class Catamaran
#   include Fuelable
#   attr_accessor :propeller_count, :hull_count, :speed, :heading

#   def initialize(num_propellers, num_hulls)
#     # fuel_specs(??, ??)...
#   end
# end

# ------------
# Question #3
# ------------

# module Moveable
#   attr_accessor :speed, :heading
#   attr_writer :fuel_capacity, :fuel_efficiency

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class FloatedVehicle
#   include Moveable

#   attr_accessor :propeller_count, :hull_count

#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers=1, num_hulls=1)
#     self.propeller_count = num_propellers
#     self.hull_count = num_hulls
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity
#   end
# end

# class WheeledVehicle
#   include Moveable

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end

# class Auto < WheeledVehicle
#   def initialize
#     # 4 tires are various tire pressures
#     super([30,30,32,32], 50, 25.0)
#   end
# end

# class Motorcycle < WheeledVehicle
#   def initialize
#     # 2 tires are various tire pressures
#     super([20,20], 80, 8.0)
#   end
# end

# class Catamaran < FloatedVehicle
#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers, num_hulls)
#     super(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers, num_hulls)
#   end
# end

# class Motorboat < FloatedVehicle

#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#   end
# end

# ------------
# Question #4
# ------------


module Moveable
  attr_accessor :speed, :heading, :range, :fuel_capacity, :fuel_efficiency

  def range
    @range += (@fuel_capacity * @fuel_efficiency)
  end
end

class FloatedVehicle
  include Moveable

  attr_accessor :propeller_count, :hull_count, :fuel_efficiency, :fuel_specs

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers=1, num_hulls=1)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    @range = 10
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    @range = 0
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran < FloatedVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers, num_hulls)
    super
  end
end

class Motorboat < FloatedVehicle

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super
  end
end

p Motorboat.ancestors
