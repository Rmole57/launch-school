class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    # self.expand(3)
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

# Question 1:
# What is wrong with the following code?

# Answer 1:
# The problem is on line 7 of the code: self.expand(3).
# Expander#expand is a private method and by definition
# cannot be called with an explicit caller, even self.

# Question 2:
# What fix(es) would you make?

# Answer 2:
# (SEE LINE 8 ABOVE!)
