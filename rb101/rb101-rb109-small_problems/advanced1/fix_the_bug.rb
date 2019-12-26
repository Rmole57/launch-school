# Original code:

# def my_method(array)
#   if array.empty?
#     []
#   elsif
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end

# Fixed code:

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]

# The problem was that there was no conditional expression
# provided for the 'elsif' branch (sort of). The program was
# considering the #map call on 'array' to be the conditional
# expression, which will always evaluate to 'true' since it will
# always return a new array (truthy value). However, since there
# is nothing after the #map call, the elsif branch has no return
# value and will thus return 'nil' for non-empty arrays.
