class School
  def initialize
    @roster = Hash.new([])
  end

  def to_h
    @roster.sort.to_h
  end

  def add(student, grade)
    (@roster[grade] += [student]).sort!
  end

  def grade(grade_num)
    @roster[grade_num]
  end
end

# ALTERNATIVE SOLUTIONS:

# 1)
# class School
#   def initialize
#     @roster = Hash.new { |roster, grade| roster[grade] = [] }
#   end

#   def to_h
#     @roster.sort.to_h
#   end

#   def add(student, grade)
#     @roster[grade].push(student).sort!
#   end

#   def grade(grade_num)
#     @roster[grade_num]
#   end
# end

# 2)
# class School
#   def initialize
#     @roster = Hash.new { |roster, grade| roster[grade] = [] }
#   end

#   def to_h
#     @roster.sort.map { |grade, students| [grade, students.sort] }.to_h
#   end

#   def add(student, grade)
#     @roster[grade] << student
#   end

#   def grade(grade_num)
#     @roster[grade_num]
#   end
# end

# 3) - Original Solution
# class School
#   def initialize
#     @roster = {}
#   end

#   def to_h
#     @roster.sort.to_h
#   end

#   def add(student, grade)
#     if @roster[grade]
#       (@roster[grade] << student).sort!
#     else
#       @roster[grade] = [student]
#     end
#   end

#   def grade(grade_num)
#     @roster[grade_num] || []
#   end
# end
