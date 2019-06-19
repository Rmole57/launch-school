def rotate_array(array)
  array[1..-1] + [array[0]]
end

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

# FURTHER EXPLORATION:

# For strings:

# def rotate_string(string)
#   rotate_array(string.chars).join
# end

# test_string = 'hello world'
# p rotate_string(test_string) == 'ello worldh'
# p test_string == 'hello world'

# For integers:

# def rotate_integer(int)
#   rotate_array(int.digits.reverse).join.to_i
# end

# test_int = 5231
# p rotate_integer(test_int) == 2315
# p test_int == 5231
