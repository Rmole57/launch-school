def reverse(array)
  reversed_array = []
  array.each { |item| reversed_array.unshift(item) }
  reversed_array
end

p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

p list = [1, 3, 2]
p new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]

# ALTERNATIVE SOLUTIONS:

# 1)
# def reverse(array)
#   reversed_array = []
#   reverse_index = -1

#   until reversed_array.size == array.size
#     reversed_array << array[reverse_index]
#     reverse_index -= 1
#   end

#   reversed_array
# end

# 2)
# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# FURTHER EXPLORATION:

# def reverse(array)
#   array.each_with_object([]) { |item, result| result.unshift(item) }
# end

# def reverse(array)
#   array.inject([]) { |acc, elem| acc.unshift(elem) }
# end
