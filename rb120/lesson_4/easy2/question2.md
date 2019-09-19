QUESTION:

We have an `Oracle` class and a `RoadTrip` class that inherits
from the `Oracle` class.
```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
```
What is the result of the following:
```ruby
trip = RoadTrip.new
trip.predict_the_future
```

ANSWER:

The result will be one of the following:
`"You will visit Vegas"`
`"You will fly to Fiji"`
`"You will romp in Rome"`

This is because you are calling `predict_the_future` on an instance
of the `RoadTrip` class, which inherits from `Oracle`. Within that
method defintion, you call `choices.sample`. When calling `choices`,
Ruby first searches the calling objects class (`RoadTrip`) before
moving up the inheritance hierarchy. So since `RoadTrip` has a
`choices` method already, Ruby calls the `RoadTrip#choices` method.

Also, this is a great example of overriding methods and polymorphism!
