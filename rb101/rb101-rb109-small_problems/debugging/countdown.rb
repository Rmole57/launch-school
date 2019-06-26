# Original program:

# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'

# The program wasn't working because you are changing the value
# of the variable local to the 'decrease' method, not the 'counter'
# variable itself. The variable being passed into the method is
# passed by reference value. By subtracting 1 you are referencing
# an entirely different object (integers are immutable) for the
# local 'counter' variable to the 'decrease' method.

# To change this simply reassign the counter variable to the return
# value of the 'decrease' method (also take out reassignment for clarity):

def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# FURTHER EXPLORATION:

# 1)
# def decrease(counter)
#   counter - 1
# end

# counter = 10

# counter.times do
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'

# 2) -- Using an 'until' loop
# def decrease(counter)
#   counter - 1
# end

# counter = 10

# until counter <= 0
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'
