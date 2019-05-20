def merge(array1, array2)
  (array1 + array2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# ALTERNATIVE SOLUTIONS:

# 1)
# def merge(array1, array2)
#   array1 | array2
# end

# 2)
# def merge(array1, array2)
#   array1.union(array2)
# end
