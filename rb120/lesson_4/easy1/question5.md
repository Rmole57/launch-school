QUESTION:

Which of these two classes has an instance variable and how do you know?
```ruby
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
```

ANSWER:

The `Pizza` class. We know from the `@` symbol used before the variable
name in `@name`, which signifies an instance variable in Ruby.

We can also create new instances of each class and call `instance_variables`
on them to see if either class has any instance variables like so:
```ruby
hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")
hot_pizza.instance_variables # => [:@name]
orange.instance_variables #=> []
```
