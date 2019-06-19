def last_digit(num)
  num % 10
end

def fibonacci_last(nth)
  return nth if nth < 2
  first, last = [0, 1]
  (2..(nth % 60)).each do
    first, last = [last_digit(last), last_digit(first + last)]
  end
  last_digit(last)
end

p fibonacci_last(15)
p fibonacci_last(20)
p fibonacci_last(100)
p fibonacci_last(100_001)
p fibonacci_last(1_000_007)
p fibonacci_last(123_456_789)
p fibonacci_last(123_456_789_987_745)

# ALTERNATIVE SOLUTIONS:

# 1)
# def fibonacci_last(nth)
#   fibonacci(nth).digits.first
# end

# 2)
# def fibonacci_last(nth)
#   fibonacci(nth).to_s[-1].to_i
# end

# 3)
# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end

# 4)
# def fibonacci_last(nth)
#   return nth if nth < 2
#   last_2 = [0, 1]
#   (2..nth).each do
#     last_2 = [last_2.last, (last_2.first + last_2.last).digits.first ]
#   end
#   last_2.last
# end

# FURTHER EXPLORATION:

# As it turns out, the last digits of the Fibonacci sequence cycle every
# 60 numbers in the sequence. So you just have to modify the input when
# you use it in the method (see the solution above).

# Also, I found this solution to be quite interesting from a fellow student:

# FIB_LAST_DIGITS = [
#   0, 1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7,
#   7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 9, 9, 8,
#   7, 5, 2, 7, 9, 6, 5, 1, 6, 7, 3, 0, 3, 3, 6, 9, 5,
#   4, 9, 3, 2, 5, 7, 2, 9, 1
#   ]

# def fibonacci_last(n)
#   FIB_LAST_DIGITS[n % 60]
# end

# The pro to this solution is that it is a simple lookup and is thus
# incredibly fast and efficient. The con is that you have to hardcode
# the pattern of the 60 last digits into a constant. Not that this is a
# huge con, and it makes sense here since, with this method, you'd only
# be using it for a Fibonacci sequence, but I wonder if a method like
# this lacks dynamism.

# With the other method implementations and algorithms, a couple of
# quick changes to the method itself could change the functionality of
# the method and perhaps repurpose it. However, the way this method is written
# (it only references the FIB_LAST_DIGITS constant) you would have to write
# an entirely new method from scratch to do that.

# Not only that, but the other algorithms/implementations are directly related
# to the algorithm for calculating a fibonacci number. This relation could help
# understand the overall Fibonacci concept on a deeper level.

# All that being said, I thought this was a very clever solution for
# optimizing efficiency.
