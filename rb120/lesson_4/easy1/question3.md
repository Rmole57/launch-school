QUESTION:

In the last question we had a module called Speed which contained a go_fast method.
We included this module in the Car class as shown below.
```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
```
When we called the go_fast method from an instance of the Car class (as shown below)
you might have noticed that the string printed when we go fast includes the name of
the type of vehicle we are using. How is this done?
```ruby
>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!
```

ANSWER:

This is done using string interpolation in the `Speed#go_fast`
method definition:
```ruby
def go_fast
  puts "I am a #{self.class} and going super fast!"
end
```
Because the `Speed` module is included in the class, all `Car` objects
have access to all of `Speed`'s methods. So when calling the instance
method `go_fast` on `small_car` an instance of `Car` it is being called
at the object level.

So using `self` refers to the object `small_car`, in this case. `self.class`
can be interpreted as `small_car.class`, and since the `class` method returns
the class of the calling object, it returns the class `Car` (the same holds
true for any instances of the `Truck` class).

The fact that we're using string interpolation (`#{}`) allows us to omit the
`to_s` call that would be needed to return the string representation of `Car`,
as string interpolation automatically calls the `to_s` method on the return value
of the expression enclosed in its curly braces (`{}`).
