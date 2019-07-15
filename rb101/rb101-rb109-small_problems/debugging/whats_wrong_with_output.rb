# Original code:

arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Fixed code:

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# In Ruby, '{}' binds the block more
# tightly to the method call than 'do...end'.
# In this case, due to Ruby's precedence rules,
# the #p method invocation binds more tightly
# to its argument than the block does to #sort,
# thus the block is never executed and #p outputs
# the result of arr.sort, ignoring the block.

# Also, parentheses could have been used to tie
# the whole method call (including the block)
# to the #p invocation.

# ALTERNATIVE SOLUTION:

# p(
#   arr.sort do |x, y|
#     y.to_i <=> x.to_i
#   end
# )
