QUESTION:

The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?


ANSWER:

This produces an error because you are trying to concatenate a String and an
Integer, `(40 + 2)`, resulting in a `TypeError`. Two ways to fix this are:

String interpolation:
```ruby
puts "the value of 40 + 2 is #{40 + 2}"
```

Integer conversion to String:
```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```
