def sum(num)
  num.digits.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# ALTERNATIVE SOLUTIONS:

# def sum(number)
#   number.to_s.chars.map(&:to_i).reduce(:+)
# end

# NOTE: This solution is useful in that it converts the number into
# an array of its digits by:
# - converting it into a string
# - breaking the string up into an array of chars
# - then converting the chars to ints

# ...which could all be used in the event that we are not allowed to
# utilize the Integer#digits method for some reason.
