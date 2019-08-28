class Person
  def name=(name)
    name_parts = name.split
    @first_name = name_parts.first
    @last_name = name_parts.last
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

# ALTERNATIVE SOLUTION:

# class Person
#   def name=(name)
#     @first_name, @last_name = name.split(' ')
#   end

#   def name
#     "#{@first_name} #{@last_name}"
#   end
# end
