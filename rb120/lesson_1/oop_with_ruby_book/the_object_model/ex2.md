A module is a collection of behaviors that is reuseable in other classes.
Their purpose is to share behaviors that you may not want to be specific
to any one class. We can use them with our classes via *mixins* like so:
```ruby
module MyModule
end

class MyClass
  include MyModule
end

my_object = MyClass.new
```