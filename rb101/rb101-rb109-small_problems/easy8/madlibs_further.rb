print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

keywords = {
  noun: noun,
  verb: verb,
  adjective: adjective,
  adverb: adverb
}

sentence1, sentence2, sentence3 = IO.readlines('madlibs.txt')

puts
puts [sentence1, sentence2, sentence3].sample % keywords

# Could also use String#format in this last line like so:
# puts format([sentence1, sentence2, sentence3].sample, keywords)
