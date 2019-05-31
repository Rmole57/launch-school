def sequence(count, first_num)
  arr = []
  1.upto(count) { |multiplicand| arr << first_num * multiplicand }
  arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# ALTERNATIVE SOLUTIONS:

# 1)
# def sequence(count, first)
#   sequence = []
#   number = first

#   count.times do
#     sequence << number
#     number += first
#   end

#   sequence
# end

# 2)
# def sequence(count, first)
#   (1..count).map { |idx| idx * first }
# end
