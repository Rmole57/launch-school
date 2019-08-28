class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

# ALTERNATIVE SOLUTIONS:

# 1)
# class Person
#   attr_writer :name
#   attr_reader :name
# end

# 2) - Manually writing the getter/setter methods.
# class Person
#   def name
#     @name
#   end

#   def name=(value)
#     @name = value
#   end
# end
