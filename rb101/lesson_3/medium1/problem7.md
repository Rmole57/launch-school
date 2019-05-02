QUESTION:

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```


ANSWER:

The output `34` because Integers are immutable objects. Therefore, `mess_with_it`
does not actually "mess with" `some_number`.
