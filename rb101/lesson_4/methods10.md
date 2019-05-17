QUESTION:

What is the return value of the following code? Why?
```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

ANSWER:

```[1, nil, nil]```

This value is returned because the block's last two iterations
have a `#puts` call as the last statement evaluated and any
`#puts` call returns `nil`.
