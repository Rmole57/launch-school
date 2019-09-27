# Tic-Tac-Toe

### General Gameplay:

Players alternate placing `X`s and `O`s on the board until either one
player has three in a row (horizontally, vertical, or diagonally),
or until all nine squares of the board are filled.

If a player is able to draw three of their `X`s or `O`s in a row, then
that player wins.

### Rules Unique to This Version of Tic-Tac-Toe:

- The "Grand Winner" is crowned once either player has won a total number
of rounds specified at the beginning of the game.
- Players will ALWAYS alternate turns. If one player wins, the losing player
will get to go first in the next round. In the event of a tie (all nine
squares filled), the last player to go (which would be the *first* player
to have gone that round) will go *second* the following round.

### Design Notes:

- I made the `WINNING_LINES` constant a `Hash` object for readability purposes.
I thought that it might read a little smoother this way. Because of this, I
included the name of an unused argument (`_axis`) in methods like `Board#winning_marker`
and `Computer#find_at_risk_square` for readability and clarity as well.
- The `LINE_SIZE` constant in the `Board` class may seem a bit unnecessary but
my intention was to introduce some flexibility in the code for future purposes.
For example, if you wanted to eventually change the size of the board you could
simply change the `LINE_SIZE` constant and the methods that utilize it should
still behave as expected (of course, there are a number of other changes that
would need to be implemented if the board size changes).
