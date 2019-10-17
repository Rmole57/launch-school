class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, colors)
    super(name, age)
    @colors = colors
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@colors} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# ALTERNATIVE SOLUTION:

# class Cat < Pet
#   attr_reader :name, :age, :colors

#   def initialize(name, age, colors)
#     super(name, age)
#     @colors = colors
#   end

#   def to_s
#     "My cat #{name} is #{age} years old and has #{colors} fur."
#   end
# end

# FURTHER EXPLORATION:

# Question:

# An alternative approach to this problem would be to modify the Pet class
# to accept a colors parameter. If we did this, we wouldn't need to supply
# an initialize method for Cat.

# Why would we be able to omit the initialize method? Would it be a good
# idea to modify Pet in this way? Why or why not? How might you deal with
# some of the problems, if any, that might arise from modifying Pet?

# Answer:

# We would be able to omit the initialize method because once we call #new
# on the Cat class Ruby will begin its search in the method lookup path for
# the #initialize method. First it will search the class it was called on
# and then it will search the next class in the inheritance hierarchy, in this
# case, the Pet class. Here it will find the #initialize method and execute
# its code.

# It probably wouldn't be a good idea to implement Pet this way. Though
# seemingly more concise, the color of every pet might not be important
# to the sub-classes of Pet. For Cat, we use it in its #to_s method. But
# what if we had a different type of pet, say a Squirrel, and we decide that
# the color of Squirrels isn't important in their description. We would be
# assigning a useless piece of data to the Squirrel class. It all really
# depends on how you plan on implementing the sub-classes of the Pet
# superclass.

# Another problem, and perhaps even worse, is if you have an already
# existing program and sub-classes inheriting from Pet. Odds are you
# will have written a bunch of code instantiating objects of classes
# that inherit from the Pet superclass. One change in its implementation
# could derail your whole program unless you go through and fix every single
# line of code to adhere to the new implementation.

# If only certain types of pets (not all) need to include a @colors attribute
# you could just create a sub-class from Pet, maybe ColoredPets, and have all
# pets that require a @colors attribute to inherit from ColoredPets while
# ColoredPets inherits from Pet. This way you can keep all of your code in one
# place.

# An alternative solution could be to create a module to mixin to those certain
# classes of pets that need @colors. In this module you could have an #initialize
# method like so:

# module Colors
#   def initialize(name, age, colors)
#     super(name, age)
#     @colors = colors
#   end
# end

# class Cat < Pet
#   include Colors

#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@colors} fur."
#   end
# end

# Because modules of the sub-class are searched in the method lookup path
# BEFORE the next class in the inheritance hierarchy (Pet), Ruby will find the
# #initialize method in the Colors module, stop searching, and execute its code.

# Note that you can still use the 'super' keyword in this case because the next
# class/module in the hierarchy is Pet. If you included another module or if
# the class you were mixing the module into inherited from a sub-class of Pet
# (say Shark inherits from Fish, which inherits from Pet and you included the Colors
# module in Shark) then you could run into a bug and the code would exhibit some
# unexpected/buggy behavior.

# To avoid this you could just write an explicit #initialize in the Colors module
# like so:

# module Colors
#   def initialize(name, age, colors)
#     @name = name
#     @age = age
#     @colors = colors
#   end
# end

# Important to note here that including an #initialize method in a module like in
# this example is purely for demonstration/exploration purposes. In reality, it's
# probably not best to do this because in a way, it goes against what module is really
# intended for, to group common behaviors and namespacing. #initialize is typically used
# in constructs that can create instances, as it is automatically called when the Class#new
# method is called. However, modules CANNOT create instances! Only classes can! So the above
# code should work as expected, but from a design/intent standpoint, it probably isn't the
# best practice.
