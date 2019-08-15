module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(amount)
    @current_speed += amount
    puts "You sped up #{amount} mph!"
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph."
  end

  def brake(amount)
    @current_speed -= amount
    puts "You slowed down #{amount} mph..."
  end

  def shut_off
    @current_speed = 0
    puts "You shut your #{color} #{year} #{model} off."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def self.total_vehicles
    puts "You have currently created #{@@number_of_vehicles} vehicles."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year} #{model}."
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{color}, #{year} #{model}."
  end
end

puts Vehicle.ancestors
puts '----------'
puts MyCar.ancestors
puts '----------'
puts MyTruck.ancestors
