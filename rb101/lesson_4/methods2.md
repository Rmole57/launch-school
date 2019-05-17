QUESTION:

How does `count` treat the block's return value? How can we find out?
```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

ANSWER:

`count` returns the number of items in the collection considering the
truthiness of the block's return value. If the block's return value
evaluates to true (is truthy), `count` 'counts' the current item.

We could find this out by consulting the Ruby docs.
