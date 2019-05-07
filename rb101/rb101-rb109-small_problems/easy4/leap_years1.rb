def leap_year?(year)
  (year % 400).zero? || ((year % 4).zero? && !(year % 100).zero?)
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# ALTERNATIVE SOLUTION:

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end

# FURTHER EXPLORATION (SEE PROBLEM FOR QUESTION PROMPT):

# The tests will fail for:
# leap_year?(2400)
# leap_year?(240000)
# leap_year?(2000)
# leap_year?(400)

# It is possible to reverse the order of the tests but it is way
# more complex than the original:

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       if year % 400 == 0
#         return true
#       end
#       return false
#     end
#     return true
#   else
#     false
#   end
# end
