# def display_top(n)
#   adjustment = (n / 2) - 1
#   (n / 2).times do |space|
#     space_between = ' ' * (adjustment - space)
#     puts "*#{space_between}*#{space_between}*".center(n)
#   end
# end

# def display_middle(n)
#   puts '*' * n
# end

# def display_bottom(n)
#   (n / 2).times do |space|
#     space_between = ' ' * space
#     puts "*#{space_between}*#{space_between}*".center(n)
#   end
# end

# def star(n)
#   if n.even? || n < 7
#     raise "Size 'n' must be an odd integer greater than or equal to 7!"
#   end
#   display_top(n)
#   display_middle(n)
#   display_bottom(n)
# end

# star(7)
# star(9)
# star(6)

# ALTERNATIVE SOLUTION:

# 1)
# def print_row(grid_size, distance_from_center)
#   number_of_spaces = distance_from_center - 1
#   spaces = ' ' * number_of_spaces
#   output = Array.new(3, '*').join(spaces)
#   puts output.center(grid_size)
# end

# def star(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(1) { |distance| print_row(grid_size, distance) }
#   puts '*' * grid_size
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

# 2)
# def build_half(n)
#   half = []
#   number_of_rows = (n - 1) / 2
#   number_of_rows.downto(1) do |row_number|
#     space_width = row_number - 1
#     row = Array.new(3, '*').join(' ' * space_width)
#     half << row.center(n)
#   end
#   half
# end

# def star(n)
#   top_half = build_half(n)
#   puts top_half
#   puts '*' * n
#   puts top_half.reverse
# end

# NOTE: An interesting concept is storing the top half in a variable (string
# or array) and then printing out the #reverse of it for the bottom half.

# FURTHER EXPLORATION:

# Circle:

# def build_half(radius)
#   half = []
#   y_origin = radius
#   y_origin.downto(0) do |y_curr|
#     x1 = radius + Math.sqrt(radius**2 - y_curr**2)
#     x2 = radius - Math.sqrt(radius**2 - y_curr**2)
#     half << "#{' ' * x2}*#{' ' * (x1 - x2)}*"
#   end
#   half
# end

# def circle(radius)
#   if radius.even? || radius < 7
#     raise "Radius must be an odd integer greater than or equal to 7!"
#   end
#   top_half = build_half(radius)
#   puts top_half, top_half.reverse
# end

# circle(7)
# circle(29)
# circle(41)

# Sine Wave:

def build_top(amplitude, frequency = 1)
  top = []

  amplitude.downto(0) do |y_curr|
    line = build_line(amplitude, y_curr)
    top << (line * frequency)
  end

  top
end

def build_bottom(amplitude, frequency = 1)
  bottom = build_top(amplitude, frequency).reverse
  shift = amplitude * 2 + 1
  bottom.map { |line| line.prepend(' ' * shift) }
end

def build_line(amplitude, y_coord)
  x_origin = Math::PI / 2
  a = Math.asin(y_coord * (1.0 / amplitude))

  x1 = ((a / x_origin) * amplitude).round
  x2 = (amplitude - x1).round
  line = "#{' ' * x1}*#{' ' * x2}"

  shift = amplitude * 2 + 1
  line << "#{line.reverse}#{' ' * shift}"
end

def sine_wave(amplitude, frequency = 1)
  top_half = build_top(amplitude, frequency)
  bottom_half = build_bottom(amplitude, frequency)
  puts top_half, bottom_half
end

sine_wave(7, 3)
sine_wave(14, 2)
sine_wave(21)
