def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# ALTERNATIVE SOLUTION:

# def word_cap(words)
#   words.split.map(&:capitalize).join(' ')
# end

# FURTHER EXPLORATION:

# 1)
# def word_cap(string)
#   words_array = string.split.map(&:downcase)
#   words_array.each do |word|
#     word[0] = word[0].upcase
#   end
#   words_array.join(' ')
# end

# 2)
# def word_cap(string)
#   words = string.split
#   words.each do |word|
#     index = 0
#     while index < word.size
#       word[index] = index.zero? ? word[index].upcase : word[index].downcase
#       index += 1
#     end
#   end
#   words.join(' ')
# end

# 3)
# def word_cap(string)
#   cap_array = []
#   string.split.each do |word|
#     cap_array << word[0].upcase + word[1..-1].downcase
#   end
#   cap_array.join(' ')
# end
