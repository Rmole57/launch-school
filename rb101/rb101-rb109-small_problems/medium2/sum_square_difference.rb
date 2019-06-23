def sum_square_difference(num)
  sum_square = (1..num).sum**2
  square_sum = (1..num).inject { |acc, elem| acc + elem**2 }
  sum_square - square_sum
end

p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# ALTERNATIVE SOLUTIONS:

# 1) -- More basic iterative implementation from lesson solution
# def sum_square_difference(n)
#   sum = 0
#   sum_of_squares = 0

#   1.upto(n) do |value|
#     sum += value
#     sum_of_squares += value**2
#   end

#   sum**2 - sum_of_squares
# end

# 2) -- Using the #map method
# def sum_square_difference(num)
#   sum_square = (1..num).sum**2
#   square_sum = (1..num).map { |n| n**2 }.sum
#   sum_square - square_sum
# end
