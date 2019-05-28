QUESTION:

Breakdown the following code:
```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

ANSWER:

Expected output:
```ruby
# => [{ :c => "cat" }]
```

The `select` method is being called on the array of hashes. The
return value will be a new array containing elements of the original
array that fit the criteria of the block. We assign the `hash` block
argument to each of the elements in the original array (which in this
case are hashes).

Within the outer block is a `all?` method call on each hash object, which
creates an inner block. This inner block is called on each key-value pair
within each hash. `all?` returns a Boolean, `true` if all elements of the
collection satisfy the inner block's requirements, `false` if any do not.

Within the inner block, the key and value of each hash item are passed in
as the block arguments `key` and `value`. Then there is an equality comparison
of the element at index `0` of the `value`. Since the value of each hash item
is a string object, the `key`, which is a symbol object, must be converted into
a string, so the `to_s` method is called on `key`, which returns the string
representation of `key`. This equality comparison returns a Boolean if both
objects are equal.

The return value of the comparison is used to determine the return value of the inner
block, which is used to determine the return value of the `all?` method, which is used
to determine the return value of the outer block, whose truthiness is used to determine
the return value of the `select` method's new array of selected items.

Since the key-value pair `b: 'elephant'` does not meet the criteria set within the
inner block, the whole hash item is not selected from the original array. However, all
of the key-value pairs in the `{c: 'cat'}` hash satisfy the inner block's requirements
and thus, that hash item is selected and returned in a new array.

FURTHER QUESTIONS:

What would happen if, instead of using `all?`, we used `any?`.
Why would this affect the return value of `select`?

ANSWER:

Both hashes would then be selected from the original array and returned in a new array
like so: `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`. This is because `any?` returns
`true` so long as the inner block returns a truthy value once. So since the key-value
pair `a: 'ant'` would meet the criteria of the inner block, `any?` would return `true`
for that hash item and thus `select` would add that item into its returned array.
