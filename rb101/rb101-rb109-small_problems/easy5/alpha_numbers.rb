NUMBER_WORDS = %w(zero one two three four five six seven
                  eight nine ten eleven twelve thirteen
                  fourteen fifteen sixteen seventeen
                  eighteen nineteen).freeze

def alphabetic_number_sort(zero_to_nineteen)
  zero_to_nineteen.sort_by { |number| NUMBER_WORDS[number] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# FURTHER EXPLORATION:

# We didn't use #sort_by! because that would modify/mutate
# the array being passed in as an argument and if there's
# no reason to modify the input in place then we shouldn't.
# Also, it would be a good idea to include a bang, (!) at the end
# of our method name to signify a mutating method.

# def alphabetic_number_sort(zero_to_nineteen)
#   zero_to_nineteen.sort { |num1, num2| NUMBER_WORDS[num1] <=> NUMBER_WORDS[num2] }
# end
