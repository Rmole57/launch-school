QUESTION:

Describe the difference between `!` and `?` in Ruby. 
And explain what would happen in the following scenarios:

1.what is `!=` and where should you use it?
2.put `!` before something, like `!user_name`
3.put `!` after something, like `words.uniq!`
4.put `?` before something
5.put `?` after something
6.put `!!` before something, like `!!user_name`


ANSWER:

The difference `!` and `?` is pretty circumstantial but I would say, in general,
`!` is typically dealing with comparisons while `?` is deailng with conditionals.
That being said, there are a bunch of cases where this is not the case depending on
how each is used. For example, in method names, any method name that ends `!` usually
mutates the caller, and any that end in `?` usually returns a boolean value based
on the condition.

NOTE: I say "usually" because having a `!` and a `?` in the method name does not
guarantee a boolean return value or mutation. Some methods do those things and don't
have `!` or `?` in their name and some methods that end in `!` or `?` don't mutate their
caller or return a boolean value. Always make sure to look up the method's implementation!

1.`!=` is a comparison operator that returns `true` if two objects are not equal. You should
  use this in writing conditional statements.

2.This would return the opposite of that object's boolean equivalent (either `true` or `false`).

3.This depends on the situation. In example given, `#uniq!` is a destructive method and mutates
  its caller. However, while it is typical that a method name ending in `!` is destructive, it
  is only part of the method name and not Ruby syntax. Thus it is always important to look at
  method documentation.

4-5.These are also circumstantial. If you put a `?` before a single character or escape sequence 
    it will create a single character string. You could put a `?` at the end of a method name to
    indicate a boolean return value for a validation method. This isn't official syntax but is a
    common convention. Also, the ternary operator, `? :` is the equivalent of using an `if...else`
    statement.

6.`!!` returns the boolean equivalent of the object (so this will return `true` or `false` depending
  on the object). So this should return `true` for everything that doesn't equate to `nil` or `false`.
