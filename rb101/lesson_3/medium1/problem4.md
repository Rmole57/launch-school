QUESTION:

Alyssa was asked to write an implementation of a rolling buffer.Elements are
added to the rolling buffer and if the buffer becomes full, then new elements
that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like `<<` or `+`
for modifying the buffer?". Is there a difference between the two, other than
what operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```


ANSWER:

The difference between the two is that `#rolling_buffer1` will mutate its `buffer` argument
while `#rolling_buffer2` will return a new array object, leaving the `input_array` argument
untouched.

This is because the `#<<` method mutates the object it's called on while `#+` is a concatenation
that returns a new array (so you need to assign it to a new object).

So `#rolling_buffer2` is creating a new object called `buffer` and assigning it a reference to
the value of `input_array + [new element]`, while `#rolling_buffer1` is modifying the input,
`buffer` in place.

The decision of which one is better depends on the program and what you need it to do. If you want
to dynamically update an array object then I would suggest using `#rolling_buffer1`, but if you need
the original array for use elsewhere in the program I would use `#rolling_buffer2` and assign its
return value (an array) to a new object.
