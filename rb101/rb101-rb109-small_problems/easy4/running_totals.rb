def running_total(array)
  running_sum = 0
  array.map { |num| running_sum += num }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# FURTHER EXPLORATION:

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) { |num, arr| arr << sum += num }
# end

# def running_total(array)
#   totals = []
#   array.inject(0) do |acc, ele|
#     totals << acc + ele
#     acc + ele
#   end
#   totals
# end
