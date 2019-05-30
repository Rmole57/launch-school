def sum_of_sums(num_arr)
  sum = 0
  num_arr.each_index { |idx| sum += num_arr[0..idx].reduce(:+) }
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# ALTERNATIVE SOLUTIONS:

# 1)
# def sum_of_sums(numbers)
#   sum_total = 0
#   accumulator = 0

#   numbers.each do |num|
#     accumulator += num
#     sum_total += accumulator
#   end

#   sum_total
# end

# 2)
# def sum_of_sums(numbers)
#   sum_total = 0
#   1.upto(numbers.size) do |count|
#     sum_total += numbers.slice(0, count).reduce(:+)
#   end
#   sum_total
# end
