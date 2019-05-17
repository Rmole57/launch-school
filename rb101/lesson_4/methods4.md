QUESTION:

What is the return value of `each_with_object` in the following code? Why?
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

ANSWER:

```{"a" => "ant", "b" => "bear", "c" => "cat"}```

`each_with_object` is iterating through the original array and taking each
value's first character (`value[0]`) and assigns it the value of the current
item in the collection. The method then returns the initally given object
argument, which in this case was a hash that was updated through iteration
within the block.
