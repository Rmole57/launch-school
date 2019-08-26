class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# ALTERNATIVE SOLUTION:

# (Manually writing the getter/setter methods)
# class Person
#   def secret
#     @secret
#   end

#   def secret=(value)
#     @secret = value
#   end
# end
