class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat"
  end
end

tabby_cat = Cat.new('tabby')
puts tabby_cat

# ALTERNATIVE SOLUTIONS:

# 1
# class Cat
#   attr_reader :type

#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     "I am a #{type} cat"
#   end
# end

# 2 (using a little more explicit of a method name)
# class Cat
#   attr_reader :type

#   def initialize(type)
#     @type = type
#   end

#   def display_type
#     puts "I am a #{type} cat"
#   end
# end
