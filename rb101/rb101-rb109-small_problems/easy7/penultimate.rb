def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# ALTERNATIVE SOLUTION:

# def penultimate(words)
#   words_array = words.split
#   words_array[-2]
# end

# FURTHER EXPLORATION:

# Edge Cases:
# - String is empty or has less than 3 words (minimum amount for a
#   detectable middle word) => raise exception
# - String with even number of words => return two middle words as
#   'middle portion'

# def middle(string)
#   words = string.split
#   length = words.size
#   mid_idx = length / 2
#   raise 'Invalid input. String must contain at least three words!' if length < 3
#   if length.even?
#     "#{words[mid_idx - 1]} #{words[mid_idx]}"
#   else
#     words[mid_idx]
#   end
# end

# Test cases:
# p middle('This sentence is five words.') # => "is"
# p middle('Now this sentence is longer than five words.') # => "is longer"
# p middle('One two.') # => Exception raised.
# p middle('One.') # => Exception raised.
# p middle('') # => Exception raised.
