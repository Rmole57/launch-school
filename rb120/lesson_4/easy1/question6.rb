class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

# ALTERNATIVE SOLUTION:

# (manually creating the getter method)
# class Cube
#   def initialize(volume)
#     @volume = volume
#   end

#   def volume
#     @volume
#   end
# end
