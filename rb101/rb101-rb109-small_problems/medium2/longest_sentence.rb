text = File.read('sample_text.txt')
lines = text.split(/(?<=\.|\!|\?)/)
lines.sort! { |a, b| b.size <=> a.size }
longest_line = lines.first.strip.gsub("\n", ' ')
words = longest_line.split.size
puts "The longest line has #{words} words:\n#{longest_line}"

# ALTERNATIVE SOLUTION:

# text = File.read('sample_text.txt')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"

# NOTE: The above solution keeps the new lines from the original text,
#       but does NOT keep the punctuation marks.

# FURTHER EXPLORATION:

# Keep punctuation marks:
# (See original solution above!)

# Longest paragraph:

# text = File.read('sample_text.txt')
# lines = text.split(/(?<=\n)\n/)
# longest_paragraph = lines.max_by { |paragraph| paragraph.split.size }
# longest_paragraph = longest_paragraph.strip.gsub("\n", ' ')
# words = longest_paragraph.split.size
# puts "The longest paragraph has #{words} words:\n#{longest_paragraph}"

# Longest word:

# text = File.read('sample_text.txt')
# words = text.split(/[^a-z]/i)
# longest_word = words.max_by { |word| word.size }
# puts "The longest word is: #{longest_word}"
