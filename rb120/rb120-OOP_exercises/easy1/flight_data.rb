# Old code:

# class Flight
#   attr_accessor :database_handle

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# New code:

class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# The attr_accessor line can be deleted entirely. It doesn't
# seem like the @database_handle attribute is something anyone
# should be able to modify nor should they really be privy to it.
# It's most likely just an implementation detail. So it's best to
# restrict access to it altogether.

# Also, if in the future we decide not to use a database at all,
# and someone has already written software/a program that utilizes
# @database_handle, we could crash the entire program. Conversely,
# if the program/software is more important than the changes proposed
# to the Flight class itself, the software's dependence on
# @database_handle may prevent us from making modifications to the
# Flight class definition/implementation for the sake of the program.

# NOTE: You might also be inclined to add an attr_reader :flight_number
# line at the top of the class definition, as the @flight_number might
# be a piece of information the user should be able to access. This
# should be perfectly fine.
