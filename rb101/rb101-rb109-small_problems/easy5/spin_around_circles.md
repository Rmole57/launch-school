QUESTION:

You are given a method named `spin_me` that takes a string as an argument
and returns a string that contains the same words, but with each word's
characters reversed. Given the method's implementation, will the returned
string be the same object as the one passed in as an argument or a different
object?

```ruby
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
```


ANSWER:

The method will return a different object because `#split` first returns
a new array object for the method to call `#each` on. Then the items of
that array are modified/mutated so technically that array object has been
modified/mutated and `#each` returns the original (now modified) array it
was called on. Finally, `#join` returns a new string object that has joined
the array object's items together.
