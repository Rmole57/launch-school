QUESTION:

If we have these two methods:
```ruby
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
```
and
```ruby
class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end
```
What is the difference in the way the code works?

ANSWER:

Both codes seem to behave the same way and achieve the same result,
but contain differences in how the result is achieved.

The first example sets the `@template` instance variable directly in
the `create_template` method rather than utilizing the setter method that
was created by `attr_accessor :template`. However, it does make use of
`template` getter method created by `attr_accessor :template` and invokes
it in the `show_template` method.

The second example on the other hand makes use of both the getter and setter
methods created by `attr_accessor :template`. The setter method, `self.template =`
is called in the `create_template` method definition, while the getter method,
`self.template` is called in the `show_template` method. The difference in the
second `show_template` method is that it is called with an explicit `self` that
is not necessary in Ruby but can be used for clarity purposes in your code (though
you should probably avoid it if it is not required).
