class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# FURTHER EXPLORATION:

# No, the FlightlessBird#initialize method is NOT necessary in this
# case because it inherits from Bird, which inherits from Animal, whose
# #initialize method will automatically be called anyway once a FlightlessBird
# instance is created.

# This is because whenever an instance of a class is created Ruby looks for
# an #initialize method to automatically call, and if one is not found in the
# instance's class, Ruby looks through the method lookup chain to find an #initialize
# method in the inheritance hierarchy, in this case the Animal#initialize method since
# Animal is a superclass of FlightlessBird.

# And since there's nothing else being done in the FlightlessBird#initialize
# method except passing the arguments up to the Animal#initialize method, we can
# omit the FlightlessBird#initialize method altogether.
