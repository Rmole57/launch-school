def sequence(limit)
  count_arr = []
  1.upto(limit) { |num| count_arr << num }
  count_arr
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# ALTERNATIVE SOLUTION:

# def sequence(number)
#   (1..number).to_a
# end

# FURTHER EXPLORATION:

# If the input is negative then #sequence should return the numbers
# counting up to -1 starting with the input:

# 1)
# def sequence(limit)
#   count_arr = []
#   if limit > 0
#     1.upto(limit) { |num| count_arr << num }
#   else
#     limit.upto(-1) { |num| count_arr << num }
#   end
#   count_arr
# end

# 2)
# def sequence(num)
#   num > 0 ? (1..num).to_a : (num..-1).to_a
# end

# Test Cases:
# p sequence(-5) == [-5, -4, -3, -2, -1]
# p sequence(-3) == [-3, -2, -1]
# p sequence(-1) == [-1]
