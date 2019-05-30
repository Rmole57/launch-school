def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# ALTERNATIVE SOLUTION:

# def repeater(string)
#   result = ''
#   string.each_char do |char|
#     result << char << char
#   end
#   result
# end
