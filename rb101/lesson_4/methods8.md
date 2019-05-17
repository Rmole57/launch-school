QUESTION:

How does `take` work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

ANSWER:

Again, we can address the Ruby docs to find this information.

`Array#take` returns the first `n` elements from the calling array.
In the method title description we see that it specifies it returns
a "new_ary". Since it returns a new array we can determine that it
is NOT a destructive method.

Also, you can simply test the method in `irb` and check the contents
of the original array before AND after the method is invoked on it.

Knowing all of this we can predict that the return value of this method
call will be: `[1, 2]`.
