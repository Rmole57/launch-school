QUESTION:

If we have this class:
```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```
What would happen if we added a `play` method to the `Bingo` class,
keeping in mind that there is already a method of this name in the
`Game` class that the `Bingo` class inherits from.

ANSWER:

This would mean that if you tried to call the `play` method on any
instance of the `Bingo` class it would call the `Bingo#play` method,
not the `Game#play` method. This is because by defining a method of
the same in the calling object's class, in this case `Bingo` you've
overridden the `play` method in the `Game` superclass.

When any method is called on an object Ruby searches the method's
lookup path/chain, which starts from the calling object's class and
works its way up the inheritance hierarchy until it either finds the
method or runs out of ancestors to search, in which case Ruby will
throw a `NoMethodError`.
