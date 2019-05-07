def multiple?(number, divisor)
  (number % divisor).zero?
end

def multisum(upper_limit)
  multiples = []
  1.upto(upper_limit) do |num|
    multiples << num if multiple?(num, 3) || multiple?(num, 5)
  end
  multiples.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

# ALTERNATIVE SOLUTION:

# def multiple?(number, divisor)
#   number % divisor == 0
# end

# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end

# FURTHER EXPLORATION (SEE PROBLEM FOR QUESTION PROMPT):

# Enumerable#inject could help in that it is designed to help find
# the sum of a collection of elements using a specified binary operation.

# It's more succinct but also less clear and more cryptic:

# def multisum(upper_limit)
#   (1..upper_limit).inject(0) do |acc, elem|
#     multiple?(elem, 3) || multiple?(elem, 5) ? acc + elem : acc
#   end
# end
