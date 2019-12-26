def transpose(matrix)
  n = matrix.size
  new_matrix = Array.new(n) { [] }
  matrix.each do |sub_arr|
    sub_arr.each do |ele|
      new_matrix[sub_arr.index(ele)] << ele
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# ALTERNATIVE SOLUTION:

# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# FURTHER EXPLORATION:

# (copying the results back into original argument)
# def transpose!(matrix)
#   new_matrix = Array.new(3) {Array.new}
#   matrix.each do |sub_arr|
#     sub_arr.each do |ele|
#       new_matrix[sub_arr.index(ele)] << ele
#     end
#   end
#   matrix.replace(new_matrix)
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose!(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

# -----------------------------

# (without copying the results)
# This solution works for any square grid (n x n).
# def transpose!(matrix)
#   n = matrix.size - 1
#   n.downto(1) do |swaps|
#     row_idx = n - swaps
#     col_idx = row_idx
#     swaps.times do
#       col_idx += 1
#       matrix[row_idx][col_idx], matrix[col_idx][row_idx] =
#         matrix[col_idx][row_idx], matrix[row_idx][col_idx]
#     end
#   end
#   matrix
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose!(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

# matrix = [
#   [1, 5, 8, 9],
#   [4, 7, 2, 6],
#   [3, 9, 6, 5],
#   [2, 7, 9, 0]
# ]

# new_matrix = transpose!(matrix)

# p new_matrix == [[1, 4, 3, 2], [5, 7, 9, 7], [8, 2, 6, 9], [9, 6, 5, 0]]
# p matrix == [[1, 4, 3, 2], [5, 7, 9, 7], [8, 2, 6, 9], [9, 6, 5, 0]]
