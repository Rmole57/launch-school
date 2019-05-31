def negative(num)
  num > 0 ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# ALTERNATIVE SOLUTION:

# def negative(number)
#   -number.abs
# end

# FURTHER EXPLORATION:

# Using #abs is more concise but maybe a bit more cryptic to some
# people if they don't know what #abs does, though it seems pretty
# self-explanatory.
