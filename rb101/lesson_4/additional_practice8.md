QUESTION:

What happens when we modify an array while we are iterating over it?
What would be output by this code?
```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

What would be output by this code?
```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

ANSWER:

Modifying an array while you're iterating over it can lead to unexpected
behavior. For example, the output of this code will be:
```
1
3
```
Some may have expected:
```
1
2
3
4
```
But when `#each` iterates through `numbers` it is doing so based on index.
So after outputting `1` at index `0`, it then goes to the number at index `1`,
but since we called the destructive `#shift` method on the array, `1` is deleted
from the array and the number at index `1` is now `3`, and once we delete `2`
from the array, there are no members of the array at index `2`, so each stops
iterating and the return value of the block is the original array, which is now
`[3, 4]`.

For similar reasons the output of the second code will be:
```
1
2
```
And the block's return value will be `[1, 2]`.
