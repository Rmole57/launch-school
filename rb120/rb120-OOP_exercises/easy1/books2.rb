class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# FURTHER EXPLORATION:

# Question:

# What do you think of this way of creating and initializing
# Book objects? (The two steps are separate.) Would it be better
# to create and initialize at the same time like in the previous
# exercise? What potential problems, if any, are introduced by
# separating the steps?

# Answer:

# This way perhaps is a little more succinct and precise, and for
# the current problem, this works just fine.

# I personally think it's better to create and initialize at the same
# time for a few of reaons. First, the object is instantiated with
# intent and purpose. It is given a unique state immediately rather
# than later. This gives us less lines execute when it comes to writing
# our program.

# But more importantly, there are methods that rely on those two states.
# In this case, the #to_s method relies on the info found in the values
# of @author and @title. So by giving ourselves extra steps to execute in
# the program, we run the risk of omitting necessary information that other
# methods in the class need to function properly.

# Another reason is accessibility for modification. Depending on the
# requirements of the program we may not want the user the ability to modify
# data once it's already been inputted as the data might be considered
# sensitive. So it might be best to stick with the assigning of states/attributes
# upon instantiation rather than later.
