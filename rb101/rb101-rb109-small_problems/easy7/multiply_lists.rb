def multiply_list(array1, array2)
  array1.zip(array2).map { |zipped_array| zipped_array.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# ALTERNATIVE SOLUTION:

# def multiply_list(list_1, list_2)
#   products = []
#   list_1.each_with_index do |item, index|
#     products << item * list_2[index]
#   end
#   products
# end

# FURTHER EXPLORATION:

# See original solution above.
