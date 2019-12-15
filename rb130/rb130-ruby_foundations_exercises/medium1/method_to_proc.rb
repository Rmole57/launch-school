def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]

# ATLERNATIVE SOLUTION:

# (Notice how we don't need to call #to_proc on base8_proc explicitly.
# Ruby does that for us when we include the & in the method invocation.)

# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# base8_proc = method(:convert_to_base_8)

# p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]
