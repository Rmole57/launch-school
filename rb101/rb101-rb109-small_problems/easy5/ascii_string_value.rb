def ascii_value(string)
  string.chars.map(&:ord).sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# ALTERNATIVE SOLUTION:

# def ascii_value(string)
#   sum = 0
#   string.each_char { |char| sum += char.ord }
#   sum
# end

# FURTHER EXPLORATION:

# char.ord.chr

# If you use a string that is longer than one character
# the method only returns the first character of the original
# string. #ord only evaluates the codepoint of the first character
# of a string.
