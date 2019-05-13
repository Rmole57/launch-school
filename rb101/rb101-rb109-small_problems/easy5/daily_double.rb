def crunch(string)
  crunch_text = ''
  string.each_char { |char| crunch_text << char unless char.eql?(crunch_text[-1]) }
  crunch_text
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

# ALTERNATIVE SOLUTION:

# 1)
# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length - 1
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end

# 2)
# def crunch(string)
#   string.chars.delete_if.with_index { |char, idx| char.eql?(string[idx + 1]) }.join
# end

# FURTHER EXPLORATION:

# You stop iterating at text.length - 1 because if you try to add
# a nil object to a string you'll raise a TypeError. However, because
# of the method's implementation, everything will still work the same
# because you only add the current character if it doesn't equal the
# subsequent character. By the time the character being evaluated is
# nil, its subsequent character will also be out of range and nil, so
# it will not be added anyway.

# One reason you may not have wanted to use #chars or #each_char because
# the blocks you pass in only take one block argument, an element of the
# string, or in this case, a character. Your solution builds the crunch_text
# through index reference comparison and using those methods you would
# have to chain another method or change the solution's way in which it
# references and compares each item. This is totally possible and pretty
# elegant in the end. But it does wind up being a bit more cryptic. So if
# you're going for clarity of logic, iterating through using a while loop
# and referencing the index of the input string may be your best bet.

# WITH #each_char AND #chars:

# def crunch(string)
#   crunch_text = ''
#   string.each_char { |char| crunch_text << char unless char.eql?(crunch_text[-1]) }
#   crunch_text
# end

# def crunch(string)
#   crunch_text = ''
#   string.chars { |char| crunch_text << char unless char.eql?(crunch_text[-1]) }
#   crunch_text
# end

# WITH REGEX:

# def crunch(string)
#   string.gsub(/(.)\1+/, '\1')
# end
