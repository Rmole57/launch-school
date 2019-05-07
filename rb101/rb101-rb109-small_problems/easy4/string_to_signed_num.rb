DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}.freeze

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def digits_only(string)
  string[0] =~ /\-|\+/ ? string[1..-1] : string
end

def string_to_signed_integer(string)
  value = string_to_integer(digits_only(string))
  string[0] == '-' ? -value : value
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

# ALTERNATIVE SOLUTION:

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# FURTHER EXPLORATION:

# def string_to_signed_integer(string)
#   digits_only = if string[0] =~ /\-|\+/
#                   string[1..-1]
#                 else
#                   string
#                 end
#   value = string_to_integer(digits_only)
#   string[0] == '-' ? -value : value
# end
