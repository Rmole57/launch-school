def rotate90(matrix)
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  result = Array.new(number_of_columns) { [] }
  (number_of_rows - 1).downto(0) do |sub_arr|
    matrix[sub_arr].each do |ele|
      result[matrix[sub_arr].index(ele)] << ele
    end
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# ALTERNATIVE SOLUTION:

# def rotate90(matrix)
#   result = []
#   number_of_rows = matrix.size
#   number_of_columns = matrix.first.size
#   (0...number_of_columns).each do |column_index|
#     new_row = (0...number_of_rows).map do |row_index|
#       matrix[row_index][column_index]
#     end
#     result << new_row.reverse
#   end
#   result
# end

# FURTHER EXPLORATION:

# VALID_DEGREES = [90, 180, 270, 360].freeze

# def valid_degree?(degrees)
#   VALID_DEGREES.include?(degrees)
# end

# def rotate(matrix, degrees)
#   return matrix if degrees.zero?

#   unless valid_degree?(degrees)
#     raise "'degrees' argument must be 90, 180, 270, or 360!"
#   end

#   number_of_rows = matrix.size
#   number_of_columns = matrix.first.size
#   result = Array.new(number_of_columns) { [] }
#   (number_of_rows - 1).downto(0) do |sub_arr|
#     matrix[sub_arr].each do |ele|
#       result[matrix[sub_arr].index(ele)] << ele
#     end
#   end
#   rotate(result, degrees - 90)
# end

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate(matrix1, 270)
# new_matrix2 = rotate(matrix2, 180)
# new_matrix3 = rotate(matrix1, 360)
# new_matrix4 = rotate(matrix2, 90)

# p new_matrix1 == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
# p new_matrix2 == [[8, 0, 1, 5], [2, 4, 7, 3]]
# p new_matrix3 == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# p new_matrix4 == [[5, 3], [1, 7], [0, 4], [8, 2]]

# # To demonstrate invalid input:
# new_matrix5 = rotate(matrix2, 210)
