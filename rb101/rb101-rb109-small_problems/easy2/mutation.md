QUESTION:

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```


ANSWER:

```
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
```

This result is output because, although `array1` and `array2` don't reference the same object
(collection), each element of `array1` shares the same reference with its `array2` counterpart
because the references are copied in by this loop:

```ruby
array1.each { |value| array2 << value }
```

These elements  happen to contain (refer to) String objects. So when you mutate the elements
of `array1` with the `String#upcase!` method, you are also mutating the elements of `array2`
that share the same references.


FURTHER EXPLORATION:

How can this feature of ruby get you in trouble? How can you avoid it?


ANSWER:

This can get you into trouble because if you're working with multiple variables/collections,
you could be making unwanted changes to those variables/collections without even realizing it.

To avoid this, we can try invoking non-destructive methods whenever possible. For example:

```ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.map! { |value| value.start_with?('C', 'S') ? value.upcase : value }
puts array2
```

Here, we're using the `Array#map!` method to mutate the collection object, `array1`, by reassigning
any value starting with 'C' or 'S' with the non-destructive `#upcase` method. This will reassign
the element to a new reference that points to a different, all-uppercase String object.

Note that Indexed Assignment is mutating for the object/collection that the element is wrapped in.
But since we just copied all of the values into `array2` from `array1`, they actually reference different
array objects (even though their elements reference the same String objects).

So, in sum, by reassigning the appropriate elements in `array1` we mutated the array object without
mutating the references to the values themselves because we reassigned the appropriate elements to
different String objects. And since `array1` and `array2` referenced different array objects from the
get-go, `array2` was left untouched.
