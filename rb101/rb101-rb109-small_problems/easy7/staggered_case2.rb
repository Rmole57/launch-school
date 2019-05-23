def staggered_case(string)
  result = string.chars
  need_upper = true
  result.each do |char|
    need_upper ? char.upcase! : char.downcase!
    need_upper = !need_upper if char =~ /[a-z]/i
  end
  result.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# ALTERNATIVE SOLUTION:

# def staggered_case(string)
#   result = ''
#   need_upper = true
#   string.chars.each do |char|
#     if char =~ /[a-z]/i
#       if need_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       need_upper = !need_upper
#     else
#       result += char
#     end
#   end
#   result
# end

# FURTHER EXPLORATION:

# def true_or_false?(choice)
#   case choice
#   when true  then true
#   when false then false
#   else
#     raise 'Keyword argument must be a boolean value (true or false)!'
#   end
# end

# def staggered_case(string, count_non_alpha:)
#   result = string.chars
#   true_or_false?(count_non_alpha)
#   need_upper = true
#   result.each do |char|
#     need_upper ? char.upcase! : char.downcase!
#     if count_non_alpha
#       need_upper = !need_upper if char =~ /[a-z]/i
#     else
#       need_upper = !need_upper
#     end
#   end
#   result.join
# end

# p staggered_case('ALL CAPS', count_non_alpha: true) == 'AlL cApS' # => true
# p staggered_case('ALL CAPS', count_non_alpha: false) == 'AlL CaPs' # => true
# p staggered_case('ALL CAPS', count_non_alpha: 'true') == 'AlL cApS' # => Exception raised.
