QUESTION:

What is the return value of the following statement? Why?
```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

ANSWER:

```11```

This is because `pop` is a destructive method that removes the
last element of a collection and returns the removed element,
in this case `"caterpillar"`, which is `11` characters long
(`size` returns the character length of its caller).
