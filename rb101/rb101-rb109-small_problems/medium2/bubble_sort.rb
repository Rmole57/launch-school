def bubble_sort!(arr)
  items_to_sort = arr.size
  until items_to_sort <= 1
    last_sorted = 0
    (1..items_to_sort - 1).each do |idx|
      if (arr[idx - 1] <=> arr[idx]) == 1
        arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
        last_sorted = idx
      end
    end
    items_to_sort = last_sorted
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# ALTERNATIVE SOLUTION:

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# FURTHER EXPLORATION:

# (Original soltion)

# def bubble_sort!(arr)
#   items_to_sort = arr.size
#   loop do
#     swapped = false
#     (items_to_sort - 1).times do |idx|
#       if arr[idx] > arr[idx + 1]
#         arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
#         swapped = true
#       end
#     end
#     break unless swapped
#     items_to_sort -= 1
#   end
#   nil
# end

# (Slighlty different implementation from final solution that
# is closer to our original solution's algorithm without optimization)

# def bubble_sort!(arr)
#   items_to_sort = arr.size
#   until items_to_sort <= 1
#     last_sorted = 0
#     (items_to_sort - 1).times do |idx|
#       if arr[idx] > arr[idx + 1]
#         arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
#         last_sorted = idx + 1
#       end
#     end
#     items_to_sort = last_sorted
#   end
#   nil
# end
