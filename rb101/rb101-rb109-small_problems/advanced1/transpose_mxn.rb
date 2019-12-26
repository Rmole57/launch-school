def transpose(matrix)
  columns = matrix[0].size
  new_matrix = Array.new(columns) { [] }
  matrix.each do |sub_arr|
    sub_arr.each do |ele|
      new_matrix[sub_arr.index(ele)] << ele
    end
  end
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# ALTERNATIVE SOLUTION:

# def transpose(matrix)
#   result = []
#   number_of_rows = matrix.size
#   number_of_columns = matrix.first.size
#   (0...number_of_columns).each do |column_index|
#     new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# FURTHER EXPLORATION:

# I actually always try to make these little programs as dynamic/maintainable
# as possible out of sheer curiosity of the concepts (I'll admit that sometimes
# I do it just to anticipate the 'Further Exploration' portions). So for me it
# was just quickly adjusting the value of 'n'.

# I do feel that starting with the 3x3 model helps 'download' the overall
# concept of what the program is supposed to be doing into my mind, solidifying
# my own mental model. Then from there, these evolutions in the programs almost
# seem like natural progressions. I think it's a good lesson in testing out code
# with simple/small data sets at first, but always keep in the mind the bigger
# picture and how you could apply your solution to larger/more varied data sets.
