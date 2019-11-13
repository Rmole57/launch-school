def zip(arr1, arr2)
  result = []
  arr1.each_with_index { |el, idx| result << [el, arr2[idx]] }
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# ALTERNATIVE SOLUTIONS:

# 1)
# def zip(array1, array2)
#   result = []
#   index = 0
#   length = array1.length
#   while index < length
#     result << [array1[index], array2[index]]
#     index += 1
#   end
#   result
# end

# 2)
# def zipper(array1, array2)
#   array1.each_with_index.with_object([]) do |(element, index), result|
#     result << [element, array2[index]]
#   end
# end
