class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    [latitude, longitude] == [other.latitude, other.longitude]
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

# The problem with the original code is there was no #== method
# for the GeoLocation class. If there is no method defined then
# Ruby will search the method lookup path for a method by the name
# of the one the being called. It travels up the inheritance hierarchy
# until it finds that method or until it reaches the top of the hierarchy.
# Since all custom objects inherit from BasicObject, calling the #== method
# on a GeoLocation object will actually be calling the BasicObject#== method,
# which, as per the documentation, only returns true if both the caller and
# the receiver are the SAME object. And according to the implementation of
# of the code, the GeoLocation objects being compared are NOT the same object
# (or the same object ID).

# First and foremost, each time a Person's location was set, it was set to a new
# instance of GeoLocation. But most importantly, the #teleport_to method creates
# a new instance of GeoLocation with new coordinates. So, although the two GeoLocation
# objects stored in each Person's @location instance variable have the same coordinates,
# they are in fact, different objects.
