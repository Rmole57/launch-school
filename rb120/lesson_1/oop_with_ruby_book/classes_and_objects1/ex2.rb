class MyCar
  attr_accessor :color
  attr_reader :year

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
    puts "You shut your #{color} #{year} #{@model} off."
  end
end

chevelle = MyCar.new('1971', 'blue', 'Chevelle')
chevelle.color = 'orange'
puts chevelle.color
puts chevelle.year
