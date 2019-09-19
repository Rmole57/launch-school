QUESTION:

If we have a class such as the one below:
```ruby
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
```
Explain what the `@@cats_count` variable does and how it works.
What code would you need to write to test your theory?

ANSWER:

`@@cats_count` is a class variable that keeps track of how many
instances of the `Cat` class are instantiated. We know this
because of where it is incremented in the code.

A couple quick ways to test this theory would be:

```ruby
cat1 = Cat.new('bengal')
cat2 = Cat.new('lion')
cat3 = Cat.new('panther')
p Cat.cats_count == 3
```
or output `@@cats_count` with each new instantiation:
```ruby
  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
    puts @@cats_count
  end
```
