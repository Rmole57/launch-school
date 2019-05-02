def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(30)
p factors(0)
p factors(-5)

# BONUS 1 ANSWER:

# The purpose of 'number % divisor == 0' is to validate the current result
# of 'number / divisor' as an integer/factor of 'number' before adding it
# to the 'factors' Array, as the remainder of the two would have to be 0
# for it to be considered a factor.

# BONUS 2 ANSWER:

# The purpose of the last 'factors' is what is known as an implicit return.
# Methods will return the last line of its definition implicitly if not
# specified otherwise (for example using the 'return' keyword for an explicit
# return). So this is making sure #factors returns the 'factors' Array.
# Otherwise the method would return the return value of the while loop, which
# would always return nil.
