def substrings_at_start(string)
  substrings = []
  string.chars.each_index do |idx|
    substrings << string[0..idx]
  end
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# ALTERNATIVE SOLUTION:

# def substrings_at_start(string)
#   result = []
#   0.upto(string.size - 1) do |index|
#     result << string[0..index]
#   end
#   result
# end
