QUESTION:

Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

```ruby
bar(foo)
```


ANSWER:

`"no"` because the return value of `foo` will always be `"yes"` and, 
when passed into `bar`, `"yes" == "no"` is false, which returns `"no"`.
