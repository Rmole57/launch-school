CONSONANTS = /[a-z&&[^aeiou]]/i

def double_consonants(string)
  string.chars.map { |char| char =~ CONSONANTS ? char * 2 : char }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# ALTERNATIVE SOLUTIONS:

# 1)
# CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

# def double_consonants(string)
#   result = ''
#   string.each_char do |char|
#     result << char
#     result << char if CONSONANTS.include?(char.downcase)
#   end
#   result
# end

# 2)
# CONSONANTS = /[^aeiou\d\s[:punct:]]/i

# def double_consonants(string)
#   string.chars.map { |char| char =~ CONSONANTS ? char * 2 : char }.join
# end
