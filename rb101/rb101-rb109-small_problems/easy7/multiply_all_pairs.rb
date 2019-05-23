def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |combo_array| combo_array.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# ALTERNATIVE SOLUTIONS:

# 1)
# def multiply_all_pairs(array_1, array_2)
#   products = []
#   array_1.each do |item_1|
#     array_2.each do |item_2|
#       products << item_1 * item_2
#     end
#   end
#   products.sort
# end

# 2)
# def multiply_all_pairs(array_1, array_2)
#   array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
# end

# FURTHER EXPLORATION:

# See original solution above.
