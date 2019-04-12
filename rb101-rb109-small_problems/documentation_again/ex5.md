QUESTION:

What do each of these puts statements output?

```ruby
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```


ANSWER:

```
#=> IndexError: index 7 outside of array bounds: -5...5
#=> beats me
#=> 49
```
