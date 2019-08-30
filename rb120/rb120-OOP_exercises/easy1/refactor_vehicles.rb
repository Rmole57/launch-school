class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

# FURTHER EXPLORATION:

# Question:

# Would it make sense to define a wheels method in Vehicle even though all
# of the remaining classes would be overriding it? Why or why not? If you
# think it does make sense, what method body would you write?

# Answer:

# Ultimately this all depends on the problem domain. For this specific
# problem, if there were no other vehicle types whatsoever and we knew
# that there were never going to be, then you could probably write a
# #wheels method in the Vehicle super class like so:

# def wheels
#   case self
#   when Car        then 4
#   when Motorcycle then 2
#   when Truck      then 6
#   end
# end

# And get rid of all of the #wheels methods in the sub-classes.

# However, this scenario is very impractical, as realistically there will
# be a growing amount of Vehicle sub-classes, all with varying amounts of
# wheels. And what about Vehicles with no wheels? Like boats, planes and
# snowmobiles? With a generic #wheels method in the super class you'll
# soon find yourself writing a very long, complex and messy bit of code
# to keep track of all the wheels.

# Maybe we could create another class to inherit from Vehicle and that
# vehicles with wheels could inherit from, call it WheeledVehicles. But
# then you still run into the problem of the varying amounts of wheels.
# It doesn't make total sense to have a default wheels value, but if you
# really wanted to, I guess the best default value would be the most common
# amount of wheels, which would probably be 4:

# class WheeledVehicles
#   def wheels
#     4
#   end
# end

# You could also create a module to mix in to your classes with wheels:

# module WheeledVehicles
#   def wheels
#     4
#   end
# end

# class Car < Vehicle
#   include WheeledVehicles
#   # rest of class definition
# end

# But again, this seems a bit impractical. Most, if not all, sub-classes from
# Vehicle will most likely override a Vehicle#wheels method and vehicles that
# don't have wheels will have no use for that method at all, in fact they might
# have to override the method to ensure that they don't inherit that method and
# return 0 from their #wheels method. That seems a bit unnecessary for a Boat
# class to contain a #wheels method simply because we wanted to include a default
# #wheels method in the Vehicle super class.

# The whole point of a super class is to contain common states and behaviors of
# related classes that inherit from it so as to avoid redundancy in your class
# definitions' code. If most classes override that method (and some unnecessarily
# having to do so because of your inclusion of it in the super class), it doesn't
# seem that you accomplish this aspect of super classes. In fact, you seem to be
# doing quite the opposite (and violating the DRY principle!).

# In the end, is it possible to implement a default Vehicle#wheels method? Sure.
# Does it really make sense and is it practical and efficient? I don't believe so.
