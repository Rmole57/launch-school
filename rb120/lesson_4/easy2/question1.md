QUESTION:

You are given the following code:
```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
```
What is the result of calling
```ruby
oracle = Oracle.new
oracle.predict_the_future
```

ANSWER:

It will return a string with a value such as `"You will eat a nice lunch."`.
Though the full string will vary depending on what string from the `choices`
method (which returns an array when invoked) is returned by `choices.sample`.
