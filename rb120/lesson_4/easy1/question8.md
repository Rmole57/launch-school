QUESTION:

If we have a class such as the one below:
```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```
You can see in the `make_one_year_older` method we have used `self`.
What does `self` refer to here?

ANSWER:

`make_one_year_older` is an instance method and can only be called
on instances of the class.

`self` here refers to calling object that is an instance of the `Cat`
class (or potentially a future subclass of `Cat`).
