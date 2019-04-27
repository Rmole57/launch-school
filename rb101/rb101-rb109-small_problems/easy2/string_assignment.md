QUESTION:

```ruby
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

What does this print out? Can you explain these results?


ANSWER:

```
BOB
BOB
```

This result is output because the `String#upcase!` method mutates the caller (modifies the string
in place). Assignment assigns a reference of an object to a variable. So since `name` and `save_name`
both refer to the same object reference, they both equal `BOB`.
