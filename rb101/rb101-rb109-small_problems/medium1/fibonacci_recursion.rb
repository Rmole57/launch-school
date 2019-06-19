def fibonacci(nth)
  return nth if nth < 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# ALTERNATIVE SOLUTION:

# def fibonacci(nth)
#   return 0 if nth == 0
#   return 1 if nth <= 2
#   fibonacci(nth - 1) + fibonacci(nth - 2)
# end

# TAIL-RECURSIVE SOLUTION:

# def fibonacci(n, depth = 2, last_two = [1, 1])
#   return last_two.last if n <= depth
#   fibonacci(n, depth + 1, [last_two.last, last_two.sum])
# end

# FURTHER EXPLORATION:

# One problem with the solution given is that it doesn't
# account for the 0th fibonacci number. So fibonacci(0) will
# equate to 1. I've corrected for this in my solution above.

# Also, I can imagine that as the "nth" parameter grows larger
# that more and more instances of the method will be stored on
# on the stack in memory, and thus using up a lot of memory in
# the process. As the stack builds the program will run slower
# and slower, and you also risk a stack overflow, which could
# crash your entire program (at the very least will result in
# unexpected behavior).
