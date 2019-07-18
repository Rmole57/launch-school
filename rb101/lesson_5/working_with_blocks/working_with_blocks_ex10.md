QUESTION:

Breakdown the following code:
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

ANSWER:

Expected output:
```ruby
[[[2, 3], [4, 5]], [6, 7]]
```

The first line has the array `[[[1, 2], [3, 4]], [5, 6]]` calling the `map` method
for each of its elements: `[[1, 2], [3, 4]]` and `[5, 6]`. Within this outer
block is another `map` call being invoked on each of the previously mentioned
elements.

The inner block for this `map` method first checks each of its elements
to see if they're an integer or array type object. This can be done quite
quickly by comparing the string representations of the objects. Since all
of the integer elements are single digits, calling `to_s` on an Integer
returns a string of size `1`. However, calling `to_s` on an array returns string
representation of the array, brackets and all, the size of which would never
come out to `1`.

If the element of the item is an integer, simply add one to the integer and return
that value. If the element is another array, the `map` method is utilized once again
to access the integer elements in each sub-array and add `1` onto each of those
elements.

The whole process is carried out like so:

- `[[1, 2], [3, 4]]` is passed into the outer block of the outer `map` method.

- `[1, 2]` is passed into the inner `map` call's block as `el`.
- `[1, 2]` is not an integer so it's passed into the innermost `map` call.
- Innermost `map` call returns a new array of `[2, 3]`.

- `[3, 4]` is passed into the inner `map` call's block as `el`.
- `[3, 4]` is not an integer so it's passed into the innermost `map` call.
- Innermost `map` call returns a new array of `[4, 5]`.

- First iteration of outer block call returns the array `[[2, 3], [4, 5]]`

- `[5, 6]` is passed into the outer block of the outer `map` method.

- `5` is passed into the inner `map` call's block as `el`.
- `5` is an integer so the block's return value is `6`.

- `6` is passed into the inner `map` call's block as `el`.
- `6` is an integer so the block's return value is `7`.

- Second iteration of outer block call returns the array `[6, 7]`

- Top-level `map` call returns `[[[2, 3], [4, 5]], [6, 7]]`
