def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  num_array = number.digits.reverse
  rotated_num = num_array[0..-(n + 1)] + rotate_array(num_array.last(n))
  rotated_num.join.to_i
end

def max_rotation(int)
  int.digits.size.downto(2) do |num|
    int = rotate_rightmost_digits(int, num)
  end
  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845

# FURTHER EXPLORATION:

# def max_rotation(int)
#   int = int.digits.reverse
#   (int.size).downto(2) do |num|
#     slice = int[-num..-1]
#     int[-num..-1] = slice[1..-1] + [slice[0]]
#   end
#   int.join.to_i
# end

# I would approach the problem step by step and break down what is
# happening in each iteration.

# The solution looks different only because all of the logic and functionality
# from the other two methods is now written right into the method rather than
# being extracted to other methods.

# The 3 part approach seems a bit easier to understand though I feel like it's
# breaking down the problem in a similar way as if we were to approach this
# problem as a whole. However, it does teach a good lesson in extracting logic
# to methods to make your code clearer and easier to parse.

# Preserving zeroes:

# def rotate_rightmost_digits(number, n)
#   num_array = number.to_s.chars
#   rotated_num = num_array[0..-(n + 1)] + rotate_array(num_array.last(n))
#   rotated_num.join
# end

# def max_rotation(int)
#   (int.to_s.chars.size).downto(2) do |num|
#     int = rotate_rightmost_digits(int, num)
#   end
#   int.to_i
# end

# p max_rotation(1000500503300) == 5301500003 # => true

# By delaying the invocation of #to_i we preserve the non-leading, consecutive
# zeroes in string form until the very end of the max rotation. Otherwise the
# zeroes get lost through each iteration in the #max_rotation method. In that
# method, as the integers rotate, consecutive zeroes will be read as leading
# zeroes by the #rotate_rightmost_digits method, which calls #to_i at the end
# its method definition, and #to_i does NOT support preservation of leading
# zeroes.

# NOTE: This solution does NOT preserve leading zeroes in its final result.
# If you would like to preserve leading zeroes you will most likely have to
# change the output data type from an integer to a string, as conversion to an
# integer does not support leading zeroes.
