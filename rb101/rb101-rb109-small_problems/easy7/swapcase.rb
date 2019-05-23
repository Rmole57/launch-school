def swapcase(string)
  swapped_string = ''
  string.each_char do |char|
    swapped_string << char.upcase if char =~ /[a-z]/
    swapped_string << char.downcase if char =~ /[A-Z]/
    swapped_string << char if char =~ /[^a-zA-Z]/
  end
  swapped_string
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# ALTERNATIVE SOLUTIONS:

# 1)
# def swapcase(string)
#   characters = string.chars.map do |char|
#     if char =~ /[a-z]/
#       char.upcase
#     elsif char =~ /[A-Z]/
#       char.downcase
#     else
#       char
#     end
#   end
#   characters.join
# end

# 2)
# def swapcase(string)
#   string.chars.map { |char| char =~ /[a-z]/ ? char.upcase : char.downcase }.join
# end
