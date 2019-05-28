arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select { |num| (num % 3).zero? }
end

p new_arr

# ALTERNATIVE SOLUTIONS:

# new_arr = arr.map do |element|
#   element.reject do |num|
#     num % 3 != 0
#   end
# end

# NOTE: Using #reject makes the code a little less readable, as
# "rejecting anything that is not a multiple of 3" is sort of like
# a double negative.

# new_arr = []
# arr.each do |sub_arr|
#   new_arr << sub_arr.select { |num| num % 3 == 0 }
# end
# new_arr
