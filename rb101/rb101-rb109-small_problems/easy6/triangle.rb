def triangle(n)
  space_counter = n - 1

  while space_counter >= 0
    puts "#{' ' * space_counter}#{'*' * (n - space_counter)}"
    space_counter -= 1
  end
end

triangle(5)
triangle(9)

# ALTERNATIVE SOLUTION:

# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   num.times do |n|
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end

# FURTHER EXPLORATION:

# Upside down solution:

# def triangle(n)
#   n.times do |spaces|
#     puts "#{' ' * spaces}#{'*' * (n - spaces)}"
#   end
# end

# Modified solution for every corner on grid:

# def print_bl_triangle(num)
#   num.times do |stars|
#     puts '*' * (stars + 1)
#   end
# end

# def print_br_triangle(num)
#   spaces = num - 1
#   num.times do |_|
#     puts "#{' ' * spaces}#{'*' * (num - spaces)}"
#     spaces -= 1
#   end
# end

# def print_tl_triangle(num)
#   num.times do |spaces|
#     puts "#{'*' * (num - spaces)}#{' ' * spaces}"
#   end
# end

# def print_tr_triangle(num)
#   num.times do |spaces|
#     puts "#{' ' * spaces}#{'*' * (num - spaces)}"
#   end
# end

# def triangle(num, angle_corner)
#   case angle_corner
#   when 'BL'
#     print_bl_triangle(num)
#   when 'BR'
#     print_br_triangle(num)
#   when 'TL'
#     print_tl_triangle(num)
#   when 'TR'
#     print_tr_triangle(num)
#   end
# end
