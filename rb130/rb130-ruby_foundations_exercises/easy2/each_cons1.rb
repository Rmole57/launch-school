def each_cons(array)
  array[0..-2].each_with_index { |el, idx| yield(el, array[idx + 1]) }
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil

# ALTERNATIVE SOLUTION:

# def each_cons(array)
#   array.each_with_index do |item, index|
#     break if index + 1 >= array.size
#     yield(item, array[index + 1])
#   end
#   nil
# end
