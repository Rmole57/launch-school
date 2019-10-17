class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# FURTHER EXPLORATION:

# Question 1:

# What are the differences between attr_reader, attr_writer, and
# attr_accessor? Why did we use attr_reader instead of one of the
# other two? Would it be okay to use one of the others? Why or why not?

# Answer 1:

# attr_reader creates getter methods, attr_writer creates
# setter methods, and attr_accessor creates both getter
# and setter methods.

# We used attr_reader for a couple of reasons. First, given
# the test cases, it seems that we only wanted users to be able
# to access the 'author' and 'title' attributes outside of the
# the class (line 15). Also, the #to_s method defined in the
# class definition calls on #title and #author to return values
# to use in its string interpolation (line 10). So you need to
# create those getter methods and the simplest way would be to
# take advantage of Ruby's shorthand and use attr_reader.

# We can't use attr_writer because it does not create getter methods
# and for the reasons stated above, that it was the program requires
# to function properly. Else we'll get an 'NoMethodError: undefined method'
# error.

# We technically could use attr_accessor, as it creates getter
# methods, but, given the problem prompt, we have received no
# indication that we should allow access to setter methods inside
# or outside the class. So we restrict that access altogether and
# only allow assignment upon instantiation.

# Question 2:

# Instead of attr_reader, suppose you had added the following methods to
# this class:

# def title
#   @title
# end

# def author
#   @author
# end

# Would this change the behavior of the class in any way? If so, how?
# If not, why not? Can you think of any advantages of this code?

# Answer 2:

# This would not change the behavior of the code as these two methods
# are just the long form of what attr_reader achieves in creating. The
# only advantage I can think of to writing this code specifically is
# increased clarity and explicitness. However, the advantage in writing
# your getter methods is the ability to add extra functionality. For example,
# if you had an instance variable @name, you could make sure it is always
# properly formatted when accessed by manually writing the getter method like so:

# def name
#   @name.capitalize
# end

# This way, whenever a user accesses this object's name the value that will
# be returned will be the capitalized version of @name. You cannot do this
# with Ruby's shorthand attr_* methods.
