QUESTION:

Given the following code...
```ruby
bob = Person.new
bob.hi
```
And the corresponding error message...
```
NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
```
What is the problem and how would you go about fixing it?

ANSWER:

The problem is that you are trying to call a private method in the,
`Person` class, `hi`, on a `Person` object (`bob` is an instance of
the `Person` class). But private methods are not accessible outside
of the class definition. So objects (instances of the class) are not
able to call private methods since they are not available to them.

One way to fix this is to move the `hi` method out of the `private`
section of the class definition (move it above the word `private` or
if it's the only private method just delete the word `private`
altogether).

Another way to fix this would be to create a public interface, which
in this case is basically a public method that calls the private
method based on some condition to check if that object has access
to the private method's capabilities/functionality.
