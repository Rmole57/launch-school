def select(array)
  counter = 0
  result_array = []

  while counter < array.size
    result_array << array[counter] if yield(array[counter])
    counter += 1
  end

  result_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# ALTERNATIVE SOLUTIONS:

# 1)
# def select(array)
#   counter = 0
#   result = []

#   while counter < array.size
#     current_element = array[counter]
#     result << current_element if yield(current_element)
#     counter += 1
#   end

#   result
# end

# 2)
# def select(array)
#   result = []
#   array.each { |el| result << el if yield(el) }
#   result
# end
