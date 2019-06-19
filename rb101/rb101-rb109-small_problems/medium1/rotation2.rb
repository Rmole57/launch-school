def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  num_array = number.digits.reverse
  rotated_num = num_array[0..-(n + 1)] + rotate_array(num_array.last(n))
  rotated_num.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# ALTERNATIVE SOLUTION:

# def rotate_rightmost_digits(number, n)
#   num_array = number.digits.reverse
#   num_array[-n..-1] = rotate_array(num_array.last(n))
#   num_array.join.to_i
# end
