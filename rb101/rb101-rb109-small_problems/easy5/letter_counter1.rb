def word_sizes(string)
  word_sizes = Hash.new(0)
  string.split.each do |word|
    word_sizes[word.size] += 1
  end
  word_sizes
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

# ALTERNATIVE SOLUTION:

# def word_sizes(string)
#   word_sizes = {}
#   string.split.each do |word|
#     if word_sizes[word.size]
#       word_sizes[word.size] += 1
#     else
#       word_sizes[word.size] = 1
#     end
#   end
#   word_sizes
# end
