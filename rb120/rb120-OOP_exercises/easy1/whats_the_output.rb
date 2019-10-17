class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# ORIGINAL (INCORRECT) OUTPUT:

# Fluffy
# My name is FLUFFY.
# FLUFFY
# FLUFFY

# CORRECTED OUTPUT:

# Fluffy
# My name is FLUFFY.
# Fluffy
# Fluffy

# FURTHER EXPLORATION:

# Question:

# Why does the below code work?

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# Output:

# 42
# My name is 42.
# 42
# 43

# Answer:

# This code "works" because of the #to_s call in the
# #initialize method. It converts any non-String objects
# passed in as a 'name' to be converted into a String.
# For String objects it returns the object itself, so '@name'
# and 'name' will be referencing the same object. But for
# non-String objects, the line, '@name = name.to_s' will
# assign the instance variable, '@name' to a NEW String object,
# a String representation of the original 'name' object
# being passed in.

# So in this case, 'name' is referencing the Integer object 42, while
# '@name' is referencing the String object "42". So the 'upcase' method
# still works on "42" that @name is referencing, and the operation '+= 1'
# still works on the Integer object 42 that 'name' is referencing. Thus
# resulting in 42 and 43 for the output, respectively. Keep in mind that
# += is considered reassignment (or "Abbreviated Assignment"), which is
# non-destructive. So 'name' is being reassigned to the NEW Integer object, 43.
# Also, it's worth noting that Integers are immutable objects (they cannot be
# mutated).

# NOTE: #puts automatically calls #to_s on its arguments so even though the
# output looks similar, it really isn't. For instance if you were to use #p
# to print out the results you would see something like this:

# "42"
# #<Pet:0x00007fb0aa912230 @name="42">
# "42"
# 43
