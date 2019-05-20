def halvsies(array)
  first_half = array.size / 2.0
  array.partition { |item| array.index(item) < first_half }
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# ALTERNATIVE SOLUTION:

# def halvsies(array)
#   first_half = array.slice(0, (array.size / 2.0).ceil)
#   second_half = array.slice(first_half.size, array.size - first_half.size)
#   [first_half, second_half]
# end

# FURTHER EXPLORATION:

# We use 2.0 to allow the 'array.size' statement, which returns an
# integer, to be converted into a float through float division. This way,
# we can utilize the Float#ceil method and add an additional element onto
# the first array as necessary.

# My solution was similar in how I calculated the half sizes of the arrays,
# but it differed in that I utilized a the Enumerable#partition method to
# build my array halves for me using a conditional statement rather than
# manually building each half on its own.
