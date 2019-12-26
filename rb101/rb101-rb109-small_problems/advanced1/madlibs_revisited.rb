NOUNS = %w(fox dog head leg).freeze
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
ADVERBS = %w(easily lazily noisily excitedly).freeze
VERBS = %w(jumps lifts bites licks).freeze

text = File.read('madlibs_text.txt')

words = text.split(/(\s)/)
words.map! do |word|
  format(word, noun:  NOUNS.sample,
               adj:   ADJECTIVES.sample,
               adv:   ADVERBS.sample,
               verb:  VERBS.sample)
end

madlib = words.join

puts madlib

# ALTERNATIVE SOLUTION:

# Text:
# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.

# Program:
# ADJECTIVES = %w(quick lazy sleepy ugly).freeze
# NOUNS      = %w(fox dog head leg cat tail).freeze
# VERBS      = %w(spins bites licks hurdles).freeze
# ADVERBS    = %w(easily lazily noisly excitedly).freeze

# File.open('madlibs_text.txt') do |file|
#   file.each do |line|
#     puts format(line, noun:      NOUNS.sample,
#                       verb:      VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb:    ADVERBS.sample)
#   end
# end

# NOTE: This solution does not take multiples of the same
# word-type on each line. So if you have a line with two
# of the same word type they'll be replaced by the same
# word rather than a different word each time. This is
# the drawback to iterating over the text line by line rather
# than word by word.
