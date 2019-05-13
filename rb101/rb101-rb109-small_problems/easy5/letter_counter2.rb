def word_sizes(string)
  word_sizes = Hash.new(0)
  string.split.each do |word|
    word_sizes[word.count('A-Za-z')] += 1
  end
  word_sizes
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

# ALTERNATIVE SOLUTION:

# def word_sizes(string)
#   word_sizes = Hash.new(0)
#   string.split.each do |word|
#     clean_word = word.delete('^A-Za-z')
#     word_sizes[clean_word.size] += 1
#   end
#   word_sizes
# end
