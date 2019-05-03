QUESTION:

To drive that last one home...let's turn the tables and have the
string show a modified output, while the array thwarts the method's
efforts to modify the caller's version of it.

```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```


ANSWER:

```
My string looks like this now: pumpkinsrutabaga
My array looks like this now: ["pumpkins"]
```

This output is being displayed for the opposite reasons as Problem 3.

The `#<<` method being called on `a_string_param` is modifying the value
of the object in place (the object ID never changes/references another
object). Thus, `my_string`, passed in as an argument, is mutated.

The `#=` operation being performed on `an_array_param` reassigns its reference
so that it is now pointing to a totally new Array object with the value:
`['pumpkins', 'rutabaga']`. Thus, `an_array_param` and `my_array` are now
pointing to entirely new objects and `my_array`'s value remains unchanged.
