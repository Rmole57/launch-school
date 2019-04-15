def is_odd?(num)
  num % 2 != 0
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)

# ALTERNATIVE SOLUTIONS:

# def is_odd?(num)
#   num % 2 == 1
# end

# FURTHER EXPLORATION:

# QUESTION 1

# This solution relies on the fact that % is the modulus operator in Ruby,
# not a remainder operator as in some other languages.
# Remainder operators return negative results if the number on
# the left is negative, while modulus always returns a non-negative result
# if the number on the right is positive.

# If you weren't certain whether % were the modulus or remainder operator,
# how would you rewrite #is_odd? so it worked regardless?

# ANSWER 1

# My solution accounts for that. But an alternative would be to use the
# Integer#abs method:

# def is_odd?(num)
#   (num % 2).abs == 1
# end

# QUESTION 2

# The Integer#remainder method performs a remainder operation in Ruby.
# Rewrite #is_odd? to use Integer#remainder instead of %.
# Note: before version 2.4, Ruby used the Numeric#remainder method instead.

# ANSWER 2

# def is_odd?(num)
#   num.remainder(2).abs == 1
# end
