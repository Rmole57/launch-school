def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  short_sum = sides[0] + sides [1]
  longest_side = sides[2]

  # Note the use of the ',' in the 'case' statement. It's the equivalent
  # of using || in an 'if' statement.
  case
  when short_sum < longest_side, sides.include?(0) then :invalid
  when sides.uniq.size == 1 then :equilateral
  when sides.uniq.size == 2 then :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# ALTERNATIVE SOLUTION:

# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_side = sides.max

#   case
#   when 2 * largest_side > sides.reduce(:+), sides.include?(0)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side1 == side3 || side2 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end
