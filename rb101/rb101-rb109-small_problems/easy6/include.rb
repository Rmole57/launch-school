def include?(array, search_value)
  array.each { |item| return true if item == search_value }
  false
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# ALTERNATIVE SOLUTION:

# def include?(array, value)
#   !!array.find_index(value)
# end

# FURTHER EXPLORATION:

# def include?(array, search_value)
#   array.any?(search_value)
# end

# def include?(array, search_value)
#   !array.none?(search_value)
# end

# def include?(array, search_value)
#   !!array.index(search_value)
# end

# def include?(array, search_value)
#   array.count(search_value) > 0
# end

# def include?(array, search_value)
#   array.bsearch { |item| return true if item == search_value }
#   false
# end
