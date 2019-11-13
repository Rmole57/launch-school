require 'set'

def map(collection)
  return collection.to_enum(:map) unless block_given?
  collection.each_with_object([]) { |item, obj| obj << yield(item) }
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map([1, 3, 4]) # => #<Enumerator: [1, 3, 4]:map>

# Hashes:
p map({:a => 1, :b => 2, :c => 3}) { |key, value| [key, value * 2] } == [[:a, 2], [:b, 4], [:c, 6]]
p map({}) { |key, value| [key, value * 2] } == []
p map({:a => 1, :b => 2}) # => #<Enumerator: {:a=>1, :b=>2}:map>

# Sets:
p map(Set[1, 3, 5, 6]) { |value| value * 2 } == [2, 6, 10, 12]
p map(Set[]) { |value| value * 2 } == []
p map(Set[3, 1, 2]) # => #<Enumerator: #<Set: {3, 1, 2}>:map>

# ALTERNATIVE SOLUTION:

# def map(array)
#   result = []
#   array.each { |item| result << yield(item) }
#   result
# end

# FURTHER EXPLORATION:

# My solution works for Arrays, Hashes, and Sets in the way that Enumerable#map does:
# - It returns an Array object (of equal element size to the calling object's size)
#   regardless of the calling collection object's type.
# - If no block is given, an Enumerator object is returned.
