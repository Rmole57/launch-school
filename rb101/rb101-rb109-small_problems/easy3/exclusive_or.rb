def xor?(arg1, arg2)
  (arg1 && !arg2) || (!arg1 && arg2)
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)

# FURTHER EXPLORATION:

# One example of where an XOR method would be helpful is people passing
# each other in a hallway. Whether or not they can pass each other largely
# depends on the other person's positioning. One, and only one, must be on
# the right and vice versa.

# XOR method is not a short-circuit evaluation of operands because no
# matter what the first operand evaluates to, it's truthiness depends on
# the evaluation of the second operand.
