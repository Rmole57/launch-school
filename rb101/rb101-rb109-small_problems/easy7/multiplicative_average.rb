def show_multiplicative_average(num_array)
  num_product = num_array.inject(:*)
  average = num_product / num_array.size.to_f
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# ALTERNATIVE SOLUTION:

# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts format('%.3f', average)
# end

# FURTHER EXPLORATION:

# If we omit the #to_f at the beginning of the method then the
# average will some out to a less-precise whole number because you'll
# be performing integer division, which truncates any numbers after a
# the decimal (it rounds down or 'floors' the result).
