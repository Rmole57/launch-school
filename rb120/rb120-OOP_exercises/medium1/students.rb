class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

# FURTHER EXPLORATION:

# I figured I'd create an Auditor class as they are still
# Students from a learning persepctive but since they typically
# are not required to take any tests or complete any assignments,
# they are seemingly anonymous aside from their ability to learn
# and attend class.

# Also, I included a CourseWork module as this would allow the
# Student subclasses that are required to, to take tests and
# complete assignments as needed (this is meant to further
# demonstrate the differences between the Student subclasses).

# module CourseWork
#   def take_test
#     # some code
#   end

#   def complete_assignment
#     # some code
#   end
# end

# class Student
#   def initialize(name = nil, year = nil)
#     @name = name
#     @year = year
#   end

#   def learn
#     # some code
#   end

#   def attend_class
#     # some code
#   end
# end

# class Graduate < Student
#   include CourseWork

#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
#   include CourseWork

#   def initialize(name, year)
#     super
#   end
# end

# class Auditor < Student
#   def initialize
#     super()
#   end
# end
