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
Which one of these is a class method (if any) and how do you know?
How would you call a class method?

ANSWER:

`self.manufacturer` is a class method, as the method name starts with
a `self.`, which in this case, `self` indicates the `Television` class.

You would call this method by using the class name followed by the method:
```ruby
Television.manufacturer
```
