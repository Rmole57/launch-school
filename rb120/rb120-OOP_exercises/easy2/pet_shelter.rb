class Pet
  attr_reader :animal_type, :name

  def initialize(animal_type, name)
    @animal_type = animal_type
    @name = name
  end

  def to_s
    "a #{animal_type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end

  def print_pet_total
    puts "#{name} has #{number_of_pets} adopted pets."
  end
end

class Shelter < Owner
  attr_reader :owners, :pets

  def initialize
    @owners = []
    @pets = []
    ObjectSpace.each_object(Pet) { |pet| add_pet(pet) }
  end

  def adopt(owner, pet)
    owners << owner unless owners.include?(owner)
    owner.add_pet(pet)
    update_pets_list
  end

  def update_pets_list
    adopted_list = []
    owners.each { |owner| adopted_list.concat(owner.pets) }
    @pets -= adopted_list
  end

  def print_adoptions
    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

  def print_unadopted
    puts 'The Animal Shelter has the following unadopted pets:'
    print_pets
    puts
  end

  def print_pet_total
    puts "The Animal Shelter has #{number_of_pets} unadopted pets."
  end
end

# Adopted.
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
buck         = Pet.new('dog', 'Buck')

# Unadopted.
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
abundy  = Owner.new('A Bundy')

shelter = Shelter.new

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(abundy, buck)

shelter.print_adoptions
shelter.print_unadopted

shelter.owners.each(&:print_pet_total)
shelter.print_pet_total

# ALTERNATIVE SOLUTION:

# class Pet
#   attr_reader :animal, :name

#   def initialize(animal, name)
#     @animal = animal
#     @name = name
#   end

#   def to_s
#     "a #{animal} named #{name}"
#   end
# end

# class Owner
#   attr_reader :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def add_pet(pet)
#     @pets << pet
#   end

#   def number_of_pets
#     pets.size
#   end

#   def print_pets
#     puts pets
#   end
# end

# class Shelter
#   def initialize
#     @owners = {}
#   end

#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     @owners[owner.name] ||= owner
#   end

#   def print_adoptions
#     @owners.each_pair do |name, owner|
#       puts "#{name} has adopted the following pets:"
#       owner.print_pets
#       puts
#     end
#   end
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# FURTHER EXPLORATION:

# (See above!)
