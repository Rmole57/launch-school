def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# ALTERNATIVE SOLUTIONS:

# 1)
# def reversed_number(number)
#   string = number.to_s
#   reversed_string = string.reverse
#   reversed_string.to_i
# end

# 2)
# def reversed_number(num)
#   num.digits.join.to_i
# end

# 3)
# def reversed_number(num)
#   reversed_num = ''
#   while num > 0
#     reversed_num << (num % 10).to_s
#     num /= 10
#   end
#   reversed_num.to_i
# end
