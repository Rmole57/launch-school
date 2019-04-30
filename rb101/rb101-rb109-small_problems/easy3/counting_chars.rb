print 'Please write word or multiple words: '
words = gets.chomp

char_count = words.delete(' ').length
puts "There are #{char_count} characters in \"#{words}\"."

# ALTERNATIVE SOLUTION:

# char_count = words.split.join.length
# puts "There are #{char_count} characters in \"#{words}\"."
