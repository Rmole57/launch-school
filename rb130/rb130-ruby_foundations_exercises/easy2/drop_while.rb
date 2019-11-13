def drop_while(array)
  result = array.clone
  array.each do |el|
    break unless yield(el)
    result.shift
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# ALTERNATIVE SOLUTIONS:

# 1)
# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end

# 2) - A more concise version of my solution above:
# def drop_while(array)
#   result = array.clone
#   array.each { |el| yield(el) ? result.shift : break }
#   result
# end

# 3) - Another solution, this time using #drop for variety:
# def drop_while(array)
#   result = array.clone
#   while !result.empty? && yield(result[0])
#     result = result.drop(1)
#   end
#   result
# end
