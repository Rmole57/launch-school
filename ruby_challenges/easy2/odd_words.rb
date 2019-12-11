def reverse_odd(str)
  words = str.split(/[^a-z]+/i)
  words.map!.with_index { |word, idx| idx.odd? ? word.reverse : word }
  words.join(' ') << '.'
end

p reverse_odd("hello.") # => "hello."
p reverse_odd("whats the matter with kansas.") # => "whats eht matter htiw kansas."
p reverse_odd("zero one two   three four   five.") # => "zero eno two eerht four evif."
p reverse_odd("This is THE oNe    .") # => "This si THE eNo."

# BONUS SOLUTION - Read and print (or deal with) each character one at a time as you would an array:

# def reverse_odd(words)
#   idx = 0
#   word_count = 0
#   result = ''

#   while idx < words.size
#     if words[idx] =~ /[a-z]/i
#       if word_count.even?
#         result << words[idx]
#       else
#         temp_idx = idx
#         while words[temp_idx + 1] =~ /[a-z]/i
#           temp_idx += 1
#         end
#         temp_idx.downto(idx) { |position| result << words[position] }
#         idx = temp_idx
#       end
#     elsif words[idx] =~ /\s/ && result[-1] !~ /\s/
#       result << words[idx]
#       word_count += 1
#     elsif words[idx] =~ /\./
#       result[-1] = '' if result[-1] == ' '
#       result << words[idx]
#     end
#     idx += 1
#   end

#   result
# end

# p reverse_odd("hello.") # => "hello."
# p reverse_odd("whats the matter with kansas.") # => "whats eht matter htiw kansas."
# p reverse_odd("zero one two   three four   five.") # => "zero eno two eerht four evif."
# p reverse_odd("This is THE oNe    .") # => "This si THE eNo."
