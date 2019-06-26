# Original program:

# cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# deck = { :hearts   => cards,
#          :diamonds => cards,
#          :clubs    => cards,
#          :spades   => cards }

# def score(card)
#   case card
#   when :ace   then 11
#   when :king  then 10
#   when :queen then 10
#   when :jack  then 10
#   else card
#   end
# end

# Pick one random card per suit

# player_cards = []
# deck.keys.each do |suit|
#   cards = deck[suit]
#   cards.shuffle!
#   player_cards << cards.pop
# end

# Determine the score of the remaining cards in the deck

# sum = deck.reduce(0) do |sum, (_, remaining_cards)|
#   remaining_cards.map do |card|
#     score(card)
#   end

#   sum += remaining_cards.sum
# end

# puts sum

# Fixed code:

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Could also use #map! method if mutation is not a problem:
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end

# Test case:

# total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
# player_sum = player_cards.map { |card| score(card) }.sum

# puts(sum == total_sum - player_sum)

puts sum

# The sum is lower because when you pick one random card per suit
# you are modifying the SAME 'cards' array that each key in 'deck' has
# as its value. So your 'pop'-ing the card from each suit in a each
# iteration. You're not getting rid of 4 cards total, you're actually
# getting rid of 4 cards per iteration, 4-cards x 4-suits = 16 cards total.

# The way to fix this is by assigning copies (or clones) of 'cards' to each
# key in 'deck', this way they'll each have their own unique set of 'cards'.
