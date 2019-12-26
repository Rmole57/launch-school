def merge(arr1, arr2)
  result = []
  idx1 = 0
  idx2 = 0

  loop do
    if idx1 >= arr1.size
      arr2[idx2..-1].each { |ele| result << ele }
      break
    elsif idx2 >= arr2.size
      arr1[idx1..-1].each { |ele| result << ele }
      break
    elsif arr1[idx1] <= arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
    else
      result << arr2[idx2]
      idx2 += 1
    end
  end

  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# ALTERNATIVE SOLUTIONS:

# 1)
# def merge(array1, array2)
#   index2 = 0
#   result = []

#   array1.each do |value|
#     while index2 < array2.size && array2[index2] <= value
#       result << array2[index2]
#       index2 += 1
#     end
#     result << value
#   end

#   result.concat(array2[index2..-1])
# end

# 2)
# def merge(arr1, arr2)
#   result = []
#   idx1 = 0
#   idx2 = 0

#   loop do
#     if idx1 >= arr1.size
#       result.concat(arr2[idx2..-1])
#       break
#     elsif idx2 >= arr2.size
#       result.concat(arr1[idx1..-1])
#       break
#     elsif arr1[idx1] <= arr2[idx2]
#       result << arr1[idx1]
#       idx1 += 1
#     else
#       result << arr2[idx2]
#       idx2 += 1
#     end
#   end

#   result
# end
