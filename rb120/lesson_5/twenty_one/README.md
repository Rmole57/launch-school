# Twenty-One

### General Gameplay:

- In `Twenty-One` a human `Player` plays against a computer `Dealer`
in accumulating the highest card total from a 52-card deck without
going over 21.

- Initially, 2 cards are dealt to each the `Dealer` and the `Player`.
The `Dealer` will have only one card visible while the `Player`'s cards
will both be visible.

- The `Player` goes first and has the option to `hit` or `stay`.
`hit` will result in the `Player` being dealt another card,
adding to their card total. However, they run the risk of going
over 21 and *"busting"*. `stay` keeps the `Player`'s current total
and concludes their turn.

- The `Dealer` then reveals their unknown card and begins their own turn.
The `Dealer` must `hit` if their card total is *below* 17. Conversely, if
their card total is *above* 17 the `Dealer` must `stay`. (It might be wise
for the `Player` to take this information into account when making their
own decision!)

- All number-cards are their face values (2s = 2, 3s = 3, 4s = 4, etc.).

- All face-cards are worth 10 (all Jacks, Queens, and Kings = 10).

- An Ace can be worth 1 or 11, depending on whether or not including
that Ace as an 11 would put your card total over 21. So if you have a 2 and
an Ace, it could be worth 13 or 3. But if you hit and get a 10, the Ace *has*
to be considered a 1 and your total would be 13 (2 + 1 + 10 = 13).

### Design Notes:

- `Player`'s name choice is relatively lenient. The only requirements are that
the name must begin with an alphabetical letter, it cannot end with a whitespace
character, and no special characters are allowed.

- You'll notice a `card_reveal` instance variable for the `TwentyOneGame` class.
This is an instance variable with a Boolean value that signifies whether or not
the `Dealer` should indeed be showing their second card at particular points in
the game.

- The `reveal_dealer_card` and `hide_dealer_card` methods, though simple one-line
methods, were created for the purposes of explicitness and clarification of intent.
Each method name is explaining what the `card_reveal` value change is meant to be
be communicating.
