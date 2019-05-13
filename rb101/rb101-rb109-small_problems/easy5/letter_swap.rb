def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# ALTERNATIVE SOLUTION:

# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end

# FURTHER EXPLORATION:

# The method would not work that way because it will return the
# swapped characters in the multiple-assignment. Remember, #map
# creates a new array containing the values returned by the block.
# So it will only return an array of arrays containing each first
# and last letter but swapped. It's important to return 'word' again
# so that the modified word is returned through each iteration of the
# #map block (index reassignment is mutating for the collection, in this
# case a string acts as a collection of chars so the string is modified
# in place).
