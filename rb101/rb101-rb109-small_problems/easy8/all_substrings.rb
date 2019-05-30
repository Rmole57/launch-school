def substrings_at_start(string)
  substrings = []
  string.chars.each_index do |idx|
    substrings << string[0..idx]
  end
  substrings
end

def substrings(string)
  all_substrings = []
  string.chars.each_index do |idx|
    all_substrings.concat(substrings_at_start(string[idx..-1]))
  end
  all_substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# ALTERNATIVE SOLUTIONS:

# 1)
# def substrings(string)
#   results = []
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1]
#     results.concat(substrings_at_start(this_substring))
#   end
#   results
# end

# 2)
# def substrings(string)
#   all_substrings = []
#   string.chars.each_index do |idx|
#     all_substrings << substrings_at_start(string[idx..-1])
#   end
#   all_substrings.flatten
# end
