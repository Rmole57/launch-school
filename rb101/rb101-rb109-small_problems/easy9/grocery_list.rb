def buy_fruit(fruits)
  fruits.each_with_object([]) do |(fruit, quantity), list|
    quantity.times { list << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]

# ALTERNATIVE SOLUTION:

# 1)
# def buy_fruit(list)
#   expanded_list = []

#   list.each do |item|
#     fruit, quantity = item[0], item[1]
#     quantity.times { expanded_list << fruit }
#   end

#   expanded_list
# end

# 2)
# def buy_fruit(list)
#   list.map { |fruit, quantity| [fruit] * quantity }.flatten
# end

# 3)
# def buy_fruit(fruits)
#   list = []
#   fruits.each do |fruit|
#     fruit[1].times { list << fruit[0] }
#   end
#   list
# end
