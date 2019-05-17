QUESTION:

What is the return value of `reject` in the following code? Why?
```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

ANSWER:

```[1, 2, 3]```

This is because `reject` returns the items within a collection
for which the given block evaluates to false (is falsey). So,
in this case, the last line of the block is `puts num` which
returns `nil` which is a falsey value. Therefore, the block
will always evaluate to false.
