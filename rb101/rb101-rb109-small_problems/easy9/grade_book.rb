def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# FURTHER EXPLORATION:

# def get_grade(grade1, grade2, grade3)
#   average = (grade1 + grade2 + grade3) / 3
#   case average
#   when 101..   then 'A+'
#   when 90..100 then 'A'
#   when 80..89  then 'B'
#   when 70..79  then 'C'
#   when 60..69  then 'D'
#   else              'F'
#   end
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"
# p get_grade(100, 105, 103) == "A+"
