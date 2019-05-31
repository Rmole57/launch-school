def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# FURTHER EXPLORATION:

# It might make more sense to return false if the string is
# empty because an empty string is neither uppercase nor lowercase.

# This is a perfect example of an edge case to consider. A different
# way of handling this edge case might be to raise an exception for
# invalid input.

# Another edge case to consider is if the string contained only
# non-alphabetic characters, such as symbols or digits. This should
# probably return false as well.

# Here's an example of a solution to cover both empty strings and
# non-alphabetic strings:

# def uppercase?(string)
#   return false if string.empty? || string !~ /[a-z]/i
#   string == string.upcase
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == false
# p uppercase?('!*-@*&_') == false
# p uppercase?('1230428') == false
