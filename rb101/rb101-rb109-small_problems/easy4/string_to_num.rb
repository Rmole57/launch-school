def string_to_integer(string)
  digits = string.chars.map { |char| char.ord - 48 }.reverse
  value = 0
  digits.each_with_index do |digit, idx|
    value += digit * 10**idx
  end
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

# ALTERNATIVE SOLUTION:

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

# FURTHER EXPLORATION:

# HEX_DIGITS = {
# '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
# '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
# 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
# 'F' => 15
# }

# def hexadecimal_to_integer(string)
#   digits = string.upcase.chars.map { |char| HEX_DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 16 * value + digit }
#   value
# end

# puts hexadecimal_to_integer('4D9f') == 19871
