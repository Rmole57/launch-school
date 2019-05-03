def color_valid(color)
  color == 'blue' || color == 'green'
end

puts color_valid('blue')
puts color_valid('green')
puts color_valid('red')

# ALTERNATIVE SOLUTION:

# def color_valid(color)
#   color.match?(/\b(blue|green)\b/)
# end
