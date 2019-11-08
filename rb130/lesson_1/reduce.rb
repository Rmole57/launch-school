def reduce(array, acc = 0)
  array.each { |el| acc = yield(acc, el) }
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# ALTERNATIVE SOLUTION:

# def reduce(array, default=0)
#   counter = 0
#   accumulator = default

#   while counter < array.size
#     accumulator = yield(accumulator, array[counter])
#     counter += 1
#   end

#   accumulator
# end

# FURTHER EXPLORATION:

# 1 - My solution:
# def reduce(array, default = nil)
#   if default
#     start = 0
#     acc = default
#   else
#     start = 1
#     acc = array.first
#   end

#   array[start..-1].each { |el| acc = yield(acc, el) }

#   acc
# end

# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }      # => 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }  # => [1, 2, 'a', 'b']
# p reduce(['a', 'b', 'c'], 'a') { |acc, value| acc += value } # => 'aabc'

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 1) { |acc, num| acc + num }                 # => 16
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# 2 - Another student's solution that I found interesting:
# def reduce(arr, default = nil)
#   array = arr.dup
#   default ||= array.shift

#   counter = 0
#   accumulator = default

#   while counter < array.size
#     accumulator = yield(accumulator, array[counter])
#     counter += 1
#   end

#   accumulator
# end

# 3 - Another solution for variety (sort of a "refactored combination" of mine and the other student's solution)
# def reduce(array, accum = nil)
#   arr = array.dup
#   accum ||= arr.shift

#   arr.each { |el| accum = yield(accum, el) }

#   accum
# end
