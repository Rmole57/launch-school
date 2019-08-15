class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year} #{model}."
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{color}, #{year} #{model}."
  end
end

chevelle = MyCar.new(1971, 'blue', 'Chevlle')
bronco = MyTruck.new(1992, 'white', 'Ford Bronco')
puts chevelle
puts bronco
