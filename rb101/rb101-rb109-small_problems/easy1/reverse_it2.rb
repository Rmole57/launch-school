def reverse_words(string)
  words = string.split
  words.map! { |word| word.size >= 5 ? word.reverse : word }
  words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')

# ALTERNATIVE SOLUTIONS:

# 1)
# def reverse_words(string)
#   words = []

#   string.split.each do |word|
#     word.reverse! if word.size >= 5
#     words << word
#   end

#   words.join(' ')
# end

# 2)
# def reverse_words(string)
#   words = string.split
#   words.each { |word| word.reverse! if word.size >= 5 }.join(' ')
# end
