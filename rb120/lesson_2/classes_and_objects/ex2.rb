class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    full_name = name.split
    @first_name = full_name.first
    @last_name = full_name.size > 1 ? full_name.last : ''
  end

  def name
    last_name.empty? ? "#{first_name}" : "#{first_name} #{last_name}"
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

# ALTERNATIVE SOLUTION:

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end
# end
