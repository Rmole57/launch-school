QUESTION:

What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```


ANSWER:

`{ :a=>"hi there" }` because by mutating `informal_greeting` you are
mutating the object it references, which in this case is the value of
`:a` in the `greetings` hash. Since you are changing the value of an
item in hash, you are mutating the hash object itself (the object ID
for `greetings` never changes).
