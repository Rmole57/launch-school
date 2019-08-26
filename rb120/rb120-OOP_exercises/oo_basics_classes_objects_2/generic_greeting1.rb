class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting

# FURTHER EXPLORATION:

# QUESTION:

# What happens if you run kitty.class.generic_greeting?
# Can you explain this result?

# ANSWER:

# The string "Hello! I'm a cat!" is printed twice. This
# happens because 'kitty.class' returns kitty's class, which
# is Cat. So the #generic_greeting method (chained onto
# the same line) is being called on the return value of
# 'kitty.class'. In this case, that's the Cat class.
