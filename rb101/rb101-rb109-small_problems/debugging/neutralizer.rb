# Original program:

# def neutralize(sentence)
#   words = sentence.split(' ')
#   words.each do |word|
#     words.delete(word) if negative?(word)
#   end

#   words.join(' ')
# end

# def negative?(word)
#   [ 'dull',
#     'boring',
#     'annoying',
#     'chaotic'
#   ].include?(word)
# end

# puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Fixed code:

# You're mutating the object 'words' as you're iterating through it.
# This delivers an unexpected result because as you change the object's
# value, it has direct consequences on how the method functions on it.

# In this case, for example, you're using the Array#each method and you have
# to know how that particular method operates/functions. It iterates through
# an Array referencing the element at each index. So when you delete the word
# 'dull', at index 1, the next iteration is moving on to the word at index 2.
# However, because you deleted the word 'dull' and mutated 'words', the word at
# index 2 is now 'cards', so it skips over the word 'boring', which should've
# been deleted.

# Luckily, Array objects also have a method called '#delete_if' that does the
# job for us because, as per the documentation, "the array is changed instantly
# every time the block is called, not after the iteration is over":

def neutralize(sentence)
  words = sentence.split(' ')
  words.delete_if { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

# ALTERNATIVE SOLUTION:

# def neutralize(sentence)
#   words = sentence.split(' ')
#   words.reject! { |word| negative?(word) }
#   words.join(' ')
# end

# FURTHER EXPLORATION:

# Implementation of #reject!:

# def mutating_reject(array)
#   i = 0
#   loop do
#     break if i == array.length

#     if yield(array[i]) # if array[i] meets the condition checked by the block
#       array.delete_at(i)
#     else
#       i += 1
#     end
#   end

#   array
# end

# The key thing to notice here is that the index ('i') is not increased if the
# block condition is met, preventin the loop from skipping over any elements.
