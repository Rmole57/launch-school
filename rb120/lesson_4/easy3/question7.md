QUESTION:

What is used in this class but doesn't add any value?
```ruby
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end
```

ANSWER:

The `return` in the `Light::information` method is superfluous.
Ruby returns the last line of any method implicitly so there is
no need for an explicit `return`.
