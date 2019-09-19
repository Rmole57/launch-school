QUESTION:

What is the default return value of `to_s` when invoked on an object?
Where could you go to find out if you want to be sure?

ANSWER:

The default return value of `to_s` is "the object's class and an
encoding of the object id", as per the Ruby documentation for
`Object#to_s`, which is what is invoked on a custom object since
all objects inherit from the `Object` class.

Of course, any custom class can override this method as many of
the built-in Ruby classes have done already.
