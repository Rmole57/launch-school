QUESTION:

What does `shift` do in the following code? How can we find out?
```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

ANSWER:

It returns this:
```[:a, "ant"]```

We can find this out by consulting the Ruby docs.

As per the Ruby documentation: "`shift` removes a key-value pair from
the original hash and returns it as a two-item array as `[key, value]`
or the hash's default value if the hash is empty."

It's also worth noting that `shift` is a destructive method, in that
it permanently modifies/mutates its caller.

So `hash` ends up becoming:
```{:b=>"bear"}```
