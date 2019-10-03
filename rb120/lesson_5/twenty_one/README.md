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

- You'll notice the `#dealer_reveal_card` is just a simple, one-line
method. Though I could just use `dealer.add_card(deck)` throughout the
rest of my program, rather than creating a whole a new method, I decided
to do the latter to be more explicit and better capture the intent of the
line when it's being used.
