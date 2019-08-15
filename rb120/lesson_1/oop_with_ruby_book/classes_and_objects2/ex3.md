QUESTION:

When running the following code...
```ruby
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
```
We get the following error...
```ruby
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
```
Why do we get this error and how to we fix it?

ANSWER:

This occurs because you have not created a `setter` method for the
`@name` instance variable. `attr_reader` only creates a `getter` method
for `@name`. We need a `setter` method as well, defined as `name=`.
One way to fix this is to change `attr_reader` to `attr_accessor` to
create both `getter` and `setter` methods for `@name`:
```ruby
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name
```
NOTE: You could also just change `attr_reader` to `attr_writer` if you
      never plan on using the `getter` method/functionality for `@name`.
