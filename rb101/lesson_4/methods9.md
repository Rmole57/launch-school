QUESTION:

What is the return value of `map` in the following code? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

ANSWER:

```[nil, "bear"]```

This result occurs because `#map` "returns a new array with the
results of the running block once for every element". Since
`"ant".size > 3` evaluates to `false` the `if` statement code never
runs and thus returns `nil`. However, `"bear.size > 3"` evaluates
to `true` and thus the block returns `"bear"`, which is how we
get the returned array of `[nil, "bear"]`.
