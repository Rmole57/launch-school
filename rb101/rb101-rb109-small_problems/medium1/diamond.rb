def print_top_half(grid_size)
  1.upto(grid_size - 1) do |num|
    stars = '*' * num
    puts stars.center(grid_size) if num.odd?
  end
end

def print_middle(grid_size)
  puts '*' * grid_size
end

def print_bottom_half(grid_size)
  (grid_size - 1).downto(1) do |num|
    stars = '*' * num
    puts stars.center(grid_size) if num.odd?
  end
end

def diamond(grid_size)
  print_top_half(grid_size)
  print_middle(grid_size)
  print_bottom_half(grid_size)
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)

# ALTERNATIVE SOLUTIONS:

# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance) { |distance| print_row(grid_size, distance) }
# end

# FURTHER EXPLORATION:

# def build_row(row_width)
#   row = Array.new(row_width, ' ')
#   row[0], row[-1] = ['*', '*']
#   row.join
# end

# def print_row(grid_size, distance_from_center)
#   row_width = grid_size - 2 * distance_from_center
#   row = build_row(row_width)
#   puts row.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance) { |distance| print_row(grid_size, distance) }
# end

# diamond(1)
# diamond(3)
# diamond(5)
# diamond(7)
# diamond(9)
