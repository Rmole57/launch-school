module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Animal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def full_name
    "#{title} #{name}"
  end

  def to_s
    full_name
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

p byron.name
# => "Byron"
p byron.title
# => "Lord"

# FURTHER EXPLORATION:

# Part A:
# (SEE ABOVE!)

# Part B:

# Question:
# Is to_s the best way to provide the name and title functionality
# we needed for this exercise?

# Answer:
# I believe modifying the classes' #to_s method was the most
# straight forward and explicit way to handle this problem.

# You could have modified the Walkable#walk method to handle
# class types like so:

# def walk
#   full_name = self.class == Noble ? "#{title} #{name}" : "#{name}"
#   "#{full_name} #{gait} forward"
# end

# The problem with a solution like this is it is very specific to the
# problem domain and isn't that maintainable. For example, if there are
# other classes that require a modification to how they are addressed then
# the #walk method would grow and grow into a long and messy piece of code.

# Modifying the #to_s methods allow you to adjust the string representations
# of the classes as you create each class rather than updating the Walkable
# module.

# Question:
# Might it be better to create either a different name method (or say a new
# full_name method) that automatically accesses @title and @name?

# Answer:
# I believe this comes down to a preference in design. On the one hand, if
# you create a full_name method, you are adding another method to the class
# and will need to override the #to_s method no matter what. This discrepancy
# will force you to establish a #to_s method for any super classes and also
# a more generalized Walkable#walk method to handle all class types (like we
# did in the above code).

# If you created a unique name method for the Noble class, you would eliminate
# the need for any #to_s methods or the Walkable#walk method to be modified, as
# all of the classes that include the Walkable module would contain the appropriate
# name getter method. However, this choice would strip users of the ability to
# access the name and title separately outside of the class. You would have to create
# a different method that parses the full name now returned by the name getter method
# into the @name and @title attributes.

# Personally, I find the #full_name method more intuitive and explicit for users to
# utilize. So if I had to choose between the two design choices it would be to create
# the #full_name method for the Noble class.

# NOTE: I refactored the code even further to avoid clutter by creating the Animal super
# class for all other classes to inherit from. Though the Noble class still has to
# contain some custom abilities/behaviors as per the problem domain/requirements.
