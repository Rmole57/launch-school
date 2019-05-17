QUESTION:

What is the return value of the select method below? Why?
```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

ANSWER:

```[1, 2, 3]```

This is because the last line evaluated in the block is `'hi'`,
which is a truthy value and thus, all elements are selected and
returned in a new array.
