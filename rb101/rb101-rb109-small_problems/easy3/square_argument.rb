def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power_to_the_n(num, power)
  result = 1
  power.times { |_| result = multiply(num, result) }
  result
end

puts square(5) == 25
puts square(-8) == 64
puts power_to_the_n(5, 3) == 125
puts power_to_the_n(6, 4) == 1296
