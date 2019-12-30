factorials = Enumerator.new do |yielder|
  factorial = counter = 1

  loop do
    yielder << factorial
    factorial *= counter
    counter += 1
  end
end

7.times { |_| puts factorials.next }

factorials.rewind

factorials.each_with_index do |factorial, idx|
  break if idx >= 7
  puts factorial
end

# ALTERNATIVE SOLUTION:

# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1
#   end
# end

# 7.times { puts factorial.next }

# factorial.rewind

# factorial.each_with_index do |number, index|
#   puts number
#   break if index == 6
# end
