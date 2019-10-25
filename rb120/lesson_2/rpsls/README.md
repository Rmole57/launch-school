# Rock Paper Scissors Lizard Spock

### Rules:

![Rock-Paper-Scissors-Lizard-Spock Rules](./rpsls_rules.png)

- Scissors cuts Paper
- Paper covers Rock
- Rock crushes Lizard
- Lizard poisons Spock
- Spock smashes Scissors
- Scissors decapitates Lizard
- Lizard eats Paper
- Paper disproves Spock
- Spock vaporizes Rock
- And as it always has...Rock crushes Scissors

### General Gameplay:

Players are pitted against a computer in a game of Rock, Paper, Scissors,
Lizard, Spock. Once the human player has chosen their move, the computer's
move is revealed and the result is recorded according to the rules (shown above).

When either the human player or the computer has reached the score limit, one of
them will be crowned the Grand Winner!

### Design Notes:

- I created classes for each `Computer` player with the intention of organizing
choice tendencies by overriding their `#choose` instance method. Because of this,
I decided to monkey-patch a `String#to_bot` method so that when a String object
is chosen at random from an Array of `Computer` names, that String choice will
create a new instance of that particular computer player's class.
- I thought it best to organize the `Move` types into their own classes and
implement a `#win?` method for each class. I felt that this helps with readability
and maintainability rather than having one `Move#win?` method with a big case statement.
As you add more and more `Move` subclasses, that case statement would just get bigger
and bigger, and more complex.
- Because of the above design decision I monkey-patched a `String#to_move` method to
easily convert move choices by the `Human` player and the `Computer` player to objects
of the appropriate `Move` subclasses.
- The `Computer` player is chosen at random at the start of the game. To add a
different dynamic to the game, I created a `Tendency` module and implemented
some tendencies that each cpu player will incorporate into their move choice. Some
of these tendencies utilize a percentage calculation based on past round results,
which are recorded for this purpose.
- Since each `Player`'s move history is recorded, I thought it might be interesting
to display the history information at the end of the game for the player to see (and
perhaps pick up on the tendencies of certain `Computer` players).
