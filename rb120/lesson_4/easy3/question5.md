QUESTION:

If I have the following class:
```ruby
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
```
What would happen if I called the methods like shown below?
```ruby
tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model
```

ANSWER:

Both `tv.model` and `Television.manufacturer` would function
properly.

Both `tv.manufacturer` and `Television.model` would throw
`NoMethodError`s. This is because in the former you're trying
to call a class method on an instance object, and in the latter
you're trying to call an instance method on a class object.
