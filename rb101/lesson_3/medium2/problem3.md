QUESTION:

Let's call a method, and pass both a string and an array as parameters
and see how even though they are treated in the same way by Ruby, the
results can be different.

Study the following code and state what will be displayed...and why:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```


ANSWER:

```
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins", "rutabaga"]
```

This output is displayed because the reassignment operation, `#+=`,
being performed on `a_string_param` is local to the method and does
not mutate the argument. It's a creating a new String object and thus
a new object ID that `a_string_param` points to. So `my_string`, still
pointing to its original object, remains unchanged.

However, the `#<<` method being performed on `an_array_param` mutates
the object (modifies the object in place). So it's altering the value
of the object ID that was passed in as an argument and thus modifying
`my_array`.
