QUESTION:

What is the block's return value in the following code? How is it determined?
Also, what is the return value of `any?` in this code and what does it output?
```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

ANSWER:

The block's return value will either be `true` or `false`
depending on the iteration and the current element being
passed into the `#odd?` method invocation. In this case,
the iterations will return `true`, `false`, `true`
because the block will be evaluating `1.odd?`, `2.odd?`,
and `3.odd?` in that order.

The return value of `any?` will be `true` because `any?`,
as per the Ruby documentation, returns `true` if the block
EVER returns a value other than `false` or `nil`, which it
does on the first iteration.

The code outputs: `1`. This is because `any?` stops iterating
as soon as a `true` value is returned by the block since there
is no need to evaluate the rest of the items.
