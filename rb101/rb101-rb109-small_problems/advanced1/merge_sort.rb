def merge(arr1, arr2)
  result = []
  idx1 = 0
  idx2 = 0

  loop do
    if idx1 >= arr1.size
      result.concat(arr2[idx2..-1])
      break
    elsif idx2 >= arr2.size
      result.concat(arr1[idx1..-1])
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

def merge_sort(arr)
  return arr if arr.size == 1
  result = arr.partition { |ele| arr.index(ele) < arr.size / 2 }
  result.map! { |sub_arr| merge_sort(sub_arr) }
  merge(result[0], result[1])
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# ALTERNATIVE SOLUTIONS:

# (Solutions below utilize a Recursive, Top-down approach)

# 1) - Without using the previous exercise's #merge method!
# def merge_sort(arr)
#   return arr if arr.size == 1
#   result = arr.partition { |ele| arr.index(ele) < arr.size / 2 }
#   result.map { |sub_arr| merge_sort(sub_arr) }.flatten.sort
# end

# 2) - Given solution by exercise!
# def merge_sort(array)
#   return array if array.size == 1

#   sub_array_1 = array[0...array.size / 2]
#   sub_array_2 = array[array.size / 2...array.size]

#   sub_array_1 = merge_sort(sub_array_1)
#   sub_array_2 = merge_sort(sub_array_2)

#   merge(sub_array_1, sub_array_2)
# end

# FURTHER EXPLORATION:

# (Solution below utilizes an Iterative, Bottom-up approach)

# def merge_sort(arr)
#   result = arr
#   sub_arr_size = 1

#   until sub_arr_size >= result.size
#     sub_arr_idx = 0
#     merging_idx = 0
#     merging_size = sub_arr_size * 2

#     until sub_arr_idx >= result.size
#       sub_arr1 = result[sub_arr_idx, sub_arr_size].to_a
#       sub_arr_idx += sub_arr_size
#       sub_arr2 = result[sub_arr_idx, sub_arr_size].to_a
#       sub_arr_idx += sub_arr_size

#       result[merging_idx, merging_size] = merge(sub_arr1, sub_arr2)
#       merging_idx += merging_size
#     end

#     sub_arr_size *= 2
#   end

#   result
# end
