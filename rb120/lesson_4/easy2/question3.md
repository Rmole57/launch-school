QUESTION:

How do you find where Ruby will look for a method when that
method is called? How can you find an object's ancestors?
```ruby
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
```
What is the lookup chain for `Orange` and `HotSauce`?

ANSWER:

You would just check the method lookup path, which is the order
in which classes/modules are inspected when you call a method.
This path consists of all of the object's class's ancestors and
can be found by calling the `Module#ancestors` method on the
object-in-question's class (of course, this is after you have already
found the class of the object/instance by calling the `Object#class`
method on it or just knowing it off the top of your head).

The lookup chain for `Orange` is:
```ruby
Orange.ancestors
# => [Orange, Taste, Object, Kernel, BasicObject]`
```

The lookup chain for `HotSauce` is:
```ruby
HotSauce.ancestors
# => [HotSauce, Taste, Object, Kernel, BasicObject]`
```
