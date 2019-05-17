statement = "The Flintstones Rock"

frequencies = Hash.new(0)

statement.chars.each do |letter|
  frequencies[letter] += 1 if letter =~ /[a-zA-Z]/
end

p frequencies

# ALTERNATIVE SOLUTION:

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end
