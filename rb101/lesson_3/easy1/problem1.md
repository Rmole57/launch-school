QUESTION:

What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```


ANSWER:

```
1
2
2
3
```

`Array#uniq` returns a new array and does NOT mutate the caller.
