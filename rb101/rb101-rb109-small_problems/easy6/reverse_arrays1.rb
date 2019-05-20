def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []
