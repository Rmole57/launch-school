class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# FURTHER EXPLORATION:

# Question:

# Is the technique we employ here to make House objects comparable
# a good one? (Hint: is there a natural way to compare Houses? Is
# price the only criteria you might use?) What problems might you
# run into, if any? Can you think of any sort of classes where including
# Comparable is a good idea?

# Answer:

# The technique employed probably isn't the best way to compare Houses.
# Perhaps the size/square footage of a house would be more intuitive.

# The problem is that there are many factors that go into comparing Houses so
# rather than mixing in the Comparable module and defining a #<=> method to
# make the instances themselves comparable, it might be more practical to just
# compare the attributes that you care about in the program itself by calling
# their respective getter methods.

# According to the Ruby docs, "The Comparable mixin is used by classes whose
# objects may be ordered." So any object whose main attribute is a String or
# an Integer may be good candidates for mixing in the Comparable module. For
# example, if we had a Surname class that kept track of the Surnames of authors
# Books in a Library. By nature, you know you're going to be dealing with a String
# object and you would most likely be alphabetizing these Surname objects. So this
# might be a good time to mix in the Comparable module and include it in the Surname
# class definition.
