def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15

# FURTHER EXPLORATION:

# For fun: what happens if the first argument is an Array?
# What do you think is happening here?

# ANSWER:

# It will return a new array with the original array's elements repeated
# the amount of times as the second number. This is happening because you
# are multiplying the array object, not its individual elements, and the result
# returns a new array built by concatenating 'n' copies of the original array.
