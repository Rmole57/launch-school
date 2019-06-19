DIGIT_HASH = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
          'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
          'eight' => '8', 'nine' => '9' }.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/i, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# FURTHER EXPLORATION:

# Uppercase and capitalized words:

# (See original solution above) or:
# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/\b#{word}\b/i, DIGIT_HASH[word])
#   end
#   words
# end

# Consecutive spaces removed for converted numbers while
# integers already in string maintain original spacing:

# def single_conversion!(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/#{word}(?=\s\d)/i, DIGIT_HASH[word])
#   end
# end

# def conversion_with_trailing_space!(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/#{word}\s/i, DIGIT_HASH[word])
#   end
# end

# def conversion_with_trailing_punct!(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/#{word}/i, DIGIT_HASH[word])
#   end
# end

# def word_to_digit(words)
#   single_conversion!(words)
#   conversion_with_trailing_space!(words)
#   conversion_with_trailing_punct!(words)
#   words
# end

# p word_to_digit('Please call me at FIVE 5  5 zERo two three four, at Seven. Thanks.')

# Phone number:

# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/\b#{word}\b/i, DIGIT_HASH[word])
#   end
#   words.gsub!(/(\d)(\s)/, '\1')
#   phone_number_regex = /\b(\d{3})(\d{3})(\d{4})\b/
#   words.gsub!(phone_number_regex, '(\1) \2-\3')
#   words
# end

# p word_to_digit('Please call me at 8 8 8 5 5 5 one two three four. Thanks.')
