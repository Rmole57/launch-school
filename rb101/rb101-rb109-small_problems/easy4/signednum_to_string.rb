DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze

def integer_to_string(number)
  value = ''
  loop do
    number, remainder = number.divmod(10)
    value.prepend(DIGITS[remainder])
    break if number.zero?
  end
  value
end

def signed_integer_to_string(number)
  value = integer_to_string(number.abs)
  if number > 0
    value.prepend('+')
  elsif number < 0
    value.prepend('-')
  else
    value
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

# ALTERNATIVE SOLUTION:

# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end

# FURTHER EXPLORATION:

# def signed_integer_to_string(number)
#   value = integer_to_string(number.abs)
#   case number <=> 0
#   when +1 then value.prepend('+')
#   when -1 then value.prepend('-')
#   else         value
#   end
# end
