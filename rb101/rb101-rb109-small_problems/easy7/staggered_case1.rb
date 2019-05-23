def staggered_case(string)
  result = string.downcase.chars
  result.map!.with_index { |char, index| index.even? ? char.upcase : char }
  result.join
end

p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# ALTERNATIVE SOLUTION:

# def staggered_case(string)
#   result = ''
#   need_upper = true
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result

# FURTHER EXPLORATION:

# Test cases:
# p staggered_case('I Love Launch School!', start_uppercase: true) # => "I LoVe lAuNcH ScHoOl!"
# p staggered_case('I Love Launch School!', start_uppercase: false) # => "i lOvE LaUnCh sChOoL!"
# p staggered_case('I Love Launch School!', start_uppercase: 'foobar') # => Exception raised.
# p staggered_case('I Love Launch School!') # => ArgumentError.

# 1)
# def true_or_false?(choice)
#   case choice
#   when true  then true
#   when false then false
#   else
#     raise 'Keyword argument must be a boolean value (true or false)!'
#   end
# end

# def staggered_case(string, start_uppercase:)
#   result = ''

#   need_upper = true_or_false?(start_uppercase)
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result
# end

# 2)
# def true_or_false?(choice)
#   case choice
#   when true  then true
#   when false then false
#   else
#     raise 'Keyword argument must be a boolean value (true or false)!'
#   end
# end

# def staggered_case(string, start_uppercase:)
#   result = string.downcase.chars
#   start_upper = true_or_false?(start_uppercase)
#   if start_upper
#     result.map!.with_index { |char, index| index.even? ? char.upcase : char }
#   else
#     result.map!.with_index { |char, index| index.odd? ? char.upcase : char }
#   end
#   result.join
# end
