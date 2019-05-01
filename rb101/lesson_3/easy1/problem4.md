QUESTION:

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names.
Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset numbers to the original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```


ANSWER:

`numbers.delete_at(1)` deletes the item in `numbers` at index 1, which in this case is `2`.
Here `numbers` becomes `[1, 3, 4, 5]`.

`numbers.delete(1)` deletes the item `1` from numbers.
Here `numbers` becomes `[2, 3, 4, 5]`.
