QUESTION:

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the sequence
until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got
an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works?


ANSWER:

The problem is that Ben is trying to access the local variable `limit` from inside
a method definition. Method definitions have their own contained scope. This means
that local variables, unless passed in as arguments, are not accessible to method
definitions.

There are a couple of ways you could fix this:

Make `limit` the constant `LIMIT`. Constants are said to "leak" into method definitions
and are thus accessible to methods:
```ruby
LIMIT = 15

def fib(first_num, second_num)
  while first_num + second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
```

Add the `limit` parameter to the method definition so you can pass the local variable
`limit` in as an argument:
```ruby
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
```
