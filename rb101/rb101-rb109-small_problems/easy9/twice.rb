def double_number?(num)
  num_string = num.to_s
  num_length = num_string.size
  half_length = num_length / 2
  first_half = num_string[0..half_length - 1]
  second_half = num_string[half_length..-1]
  num_length.even? && first_half == second_half
end

def twice(num)
  double_number?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# ALTERNATIVE SOLUTIONS:

# 1)
# def twice(number)
#   string_number = number.to_s
#   center = string_number.size / 2
#   left_side = center.zero? ? '' : string_number[0..center - 1]
#   right_side = string_number[center..-1]

#   return number if left_side == right_side
#   return number * 2
# end

# 2)
# def double_number?(num)
#   num_string = num.to_s
#   num_length = num_string.size
#   half_length = num_length / 2
#   first_half = num_string[0, half_length]
#   second_half = num_string[-half_length, half_length]
#   num_length.even? && first_half == second_half
# end

# def twice(num)
#   double_number?(num) ? num : num * 2
# end
