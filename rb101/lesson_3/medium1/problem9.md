QUESTION:

Method calls can take expressions as arguments. Suppose we define a
method called `rps` as follows, which follows the classic rules of
rock-paper-scissors game, but with a slight twist that it declares
whatever hand was used in the tie as the result of that tie.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```


ANSWER:

`paper` because, working our way out from the innermost calls of
`rps`, the final `rps` call ends up being `rps("paper", "rock")`,
which returns `"paper"`.

NOTE: Calling `#puts` on a string will output the string without
      the argument's outermost quotation marks.
