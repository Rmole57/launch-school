QUESTION:

Which of the following are objects in Ruby?
If they are objects, how can you find out what class they belong to?

1. `true`
2. `"hello"`
3. `[1, 2, 3, "happy days"]`
4. `142`

ANSWER:

All of these are objects in Ruby (everything in Ruby is an object)!
If you want to find out what class they belong to you could simply
call the `Object#class` method on each of them like so:

```ruby
true.class # => TrueClass
"hello".class # => String
[1, 2, 3, "happy days"].class # => Array
142.class # => Integer
```
