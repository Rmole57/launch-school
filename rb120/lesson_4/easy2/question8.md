QUESTION:

If we have this class:
```ruby
class Game
  def play
    "Start the game!"
  end
end
```
And another class:
```ruby
class Bingo
  def rules_of_play
    #rules of play
  end
end
```
What can we add to the `Bingo` class to allow it to inherit the
`play` method from the `Game` class?

ANSWER:

```ruby
class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```
To test out that this worked simply instantiate a new instance of
the `Bingo` class and try calling `play` on it.
```ruby
game_of_bingo = Bingo.new
game_of_bingo.play # => "Start the game!"
```
