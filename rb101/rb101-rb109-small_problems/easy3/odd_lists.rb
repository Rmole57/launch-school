def oddities(array)
  array.select.with_index { |_, idx| idx.even? }
end

def even_items(array)
  array.select.with_index { |_, idx| idx.odd? }
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

p even_items([2, 3, 4, 5, 6])
p even_items([1, 2, 3, 4, 5, 6])
p even_items(['abc', 'def'])
p even_items([123])
p even_items([])

# ALTERNATIVE SOLUTIONS:

# def oddities(array)
#   odd_elements = []
#   array.each_index { |idx| odd_elements << array[idx] if idx.even? }
#   odd_elements
# end

# def oddities(array)
#   odd_elements = []
#   index = 0
#   while index < array.size
#     odd_elements << array[index]
#     index += 2
#   end
#   odd_elements
# end
