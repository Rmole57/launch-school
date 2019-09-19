class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    Greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

# ALTERNATIVE SOLUTIONS:


# 1 - (just changing the imperative code at top level)
# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.new.hi

# 2 - solution given; changing the Hello#hi method to a class
#     method, then changing the Hello::hi method definition
#     so that you instantiate a Greeting object and call the
#     #greet instance method on that since instance methods
#     CANNOT be called on class objects (this is a bit cumbersome
#     as the solution explains)
# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def self.hi
#     greeting = Greeting.new
#     greeting.greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.hi
