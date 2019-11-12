def count(collection)
  counter = 0
  collection.each { |el| counter += 1 if yield(el) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# FURTHER EXPLORATION:

# 1)
# def count(collection)
#   counter = 0
#   collection.each { |el| counter += 1 if yield(el) }
#   counter
# end

# 2)
# def count(collection)
#   collection.select { |el| yield(el) }.size
# end

# 3)
# def count(collection)
#   counter = 0
#   for el in collection
#     counter += 1 if yield(el)
#   end
#   counter
# end
