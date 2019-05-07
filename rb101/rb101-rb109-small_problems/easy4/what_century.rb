CENTURY_SUFFIXES = {
  0 => 'th',
  1 => 'st',
  2 => 'nd',
  3 => 'rd'
}.freeze

def century(year)
  century = year / 100 + 1
  century -= 1 if (year % 100).zero?
  century.to_s + suffix(century)
end

def suffix(century)
  return 'th' if century.digits.reverse[-2] == 1
  CENTURY_SUFFIXES[(century % 10)]
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(90) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

# ALTERNATIVE SOLUTION:

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end
