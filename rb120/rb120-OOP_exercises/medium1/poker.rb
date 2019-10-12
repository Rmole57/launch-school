class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class PokerHand
  def initialize(deck)
    @hand = []
    @rank_counts = Hash.new(0)

    5.times do |_|
      @hand << deck.draw
      @rank_counts[@hand.last.rank] += 1
    end
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    # Below you could also use:
    # - @hand.min.rank == 10
    # - @hand.max.value == 14
    # - @hand.max.rank == 'Ace'
    straight_flush? && @hand.min.value == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def n_of_a_kind?(num)
    @rank_counts.one? { |_, count| count == num } 
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    suits = @hand.map { |card| card.suit }
    suits.all? { |suit| suit == suits.first }
  end

  def straight?
    return false unless @rank_counts.size == 5
    @hand.min.value == @hand.max.value - 4
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    @rank_counts.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

# Tests:
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# ALTERNATIVE SOLUTION:

# class PokerHand
#   def initialize(cards)
#     @cards = []
#     @rank_count = Hash.new(0)

#     5.times do
#       card = cards.draw
#       @cards << card
#       @rank_count[card.rank] += 1
#     end
#   end

#   def print
#     puts @cards
#   end

#   def evaluate
#     if    royal_flush?     then 'Royal flush'
#     elsif straight_flush?  then 'Straight flush'
#     elsif four_of_a_kind?  then 'Four of a kind'
#     elsif full_house?      then 'Full house'
#     elsif flush?           then 'Flush'
#     elsif straight?        then 'Straight'
#     elsif three_of_a_kind? then 'Three of a kind'
#     elsif two_pair?        then 'Two pair'
#     elsif pair?            then 'Pair'
#     else 'High card'
#     end
#   end

#   private

#   def flush?
#     suit = @cards.first.suit
#     @cards.all? { |card| card.suit == suit }
#   end

#   def straight?
#     return false if @rank_count.any? { |_, count| count > 1 }

#     @cards.min.value == @cards.max.value - 4
#   end

#   def n_of_a_kind?(number)
#     @rank_count.one? { |_, count| count == number }
#   end

#   def straight_flush?
#     flush? && straight?
#   end

#   def royal_flush?
#     straight_flush? && @cards.min.rank == 10
#   end

#   def four_of_a_kind?
#     n_of_a_kind?(4)
#   end

#   def full_house?
#     n_of_a_kind?(3) && n_of_a_kind?(2)
#   end

#   def three_of_a_kind?
#     n_of_a_kind?(3)
#   end

#   def two_pair?
#     @rank_count.select { |_, count| count == 2 }.size == 2
#   end

#   def pair?
#     n_of_a_kind?(2)
#   end
# end

# FURTHER EXPLORATION:

# Question 1 (public class methods):
# class PokerHand
#   def self.ranks(cards)
#     cards.map(&:rank)
#   end

#   def self.royal_flush?(cards)
#     straight_flush?(cards) && cards.min.value == 10
#   end

#   def self.straight_flush?(cards)
#     straight?(cards) && flush?(cards)
#   end

#   def self.n_of_a_kind?(cards, num)
#     ranks = ranks(cards)
#     ranks.any? { |rank| ranks.count(rank) == num }
#   end

#   def self.four_of_a_kind?(cards)
#     n_of_a_kind?(cards, 4)
#   end

#   def self.full_house?(cards)
#     three_of_a_kind?(cards) && pair?(cards)
#   end

#   def self.flush?(cards)
#     suits = cards.map(&:suit)
#     suits.all? { |suit| suit == suits.first }
#   end

#   def self.straight?(cards)
#     ranks = ranks(cards)
#     return false unless ranks.uniq.size == 5
#     cards.min.value == cards.max.value - 4
#   end

#   def self.three_of_a_kind?(cards)
#     n_of_a_kind?(cards, 3)
#   end

#   def self.two_pair?(cards)
#     ranks = ranks(cards)
#     ranks.select { |rank| ranks.count(rank) == 2 }.uniq.size == 2
#   end

#   def self.pair?(cards)
#     n_of_a_kind?(cards, 2)
#   end
# end

# hand = PokerHand.royal_flush?([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand == true

# hand = PokerHand.straight_flush?([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand == true

# hand = PokerHand.four_of_a_kind?([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand == true

# hand = PokerHand.full_house?([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand == true

# hand = PokerHand.flush?([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand == true

# hand = PokerHand.straight?([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand == true

# hand = PokerHand.straight?([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand == true

# hand = PokerHand.three_of_a_kind?([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand == true

# hand = PokerHand.two_pair?([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand == true

# hand = PokerHand.pair?([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand == true

# hand = PokerHand.pair?([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand == false

# Question 2 (comparing two hands):
# class PokerHand
#   include Comparable

#   HAND_VALUES = {
#     'High card'       => 1,
#     'Pair'            => 2,
#     'Two pair'        => 3,
#     'Three of a kind' => 4,
#     'Straight'        => 5,
#     'Flush'           => 6,
#     'Full house'      => 7,
#     'Four of a kind'  => 8,
#     'Straight flush'  => 9,
#     'Royal flush'     => 10
#   }.freeze

#   def initialize(cards)
#     @cards = []
#     @rank_count = Hash.new(0)

#     5.times do
#       card = cards.draw
#       @cards << card
#       @rank_count[card.rank] += 1
#     end
#   end

#   def print
#     puts @cards
#   end

#   def evaluate
#     if    royal_flush?     then 'Royal flush'
#     elsif straight_flush?  then 'Straight flush'
#     elsif four_of_a_kind?  then 'Four of a kind'
#     elsif full_house?      then 'Full house'
#     elsif flush?           then 'Flush'
#     elsif straight?        then 'Straight'
#     elsif three_of_a_kind? then 'Three of a kind'
#     elsif two_pair?        then 'Two pair'
#     elsif pair?            then 'Pair'
#     else 'High card'
#     end
#   end

#   def <=>(other_hand)
#     compare_value = HAND_VALUES[self.evaluate] <=> HAND_VALUES[other_hand.evaluate]
#     return best_hand(self, other_hand) if compare_value.zero?
#     compare_value
#   end

#   protected

#   attr_reader :cards

#   private

#   def flush?
#     suit = cards.first.suit
#     cards.all? { |card| card.suit == suit }
#   end

#   def straight?
#     return false if @rank_count.any? { |_, count| count > 1 }

#     cards.min.value == cards.max.value - 4
#   end

#   def n_of_a_kind?(number)
#     @rank_count.one? { |_, count| count == number }
#   end

#   def straight_flush?
#     flush? && straight?
#   end

#   def royal_flush?
#     straight_flush? && cards.min.rank == 10
#   end

#   def four_of_a_kind?
#     n_of_a_kind?(4)
#   end

#   def full_house?
#     n_of_a_kind?(3) && n_of_a_kind?(2)
#   end

#   def three_of_a_kind?
#     n_of_a_kind?(3)
#   end

#   def two_pair?
#     @rank_count.select { |_, count| count == 2 }.size == 2
#   end

#   def pair?
#     n_of_a_kind?(2)
#   end

#   def best_hand(hand1, hand2)
#     case hand1.evaluate
#     when four_of_a_kind?
#       four_kind_compare
#     when full_house?
#       full_house_compare
#     when three_of_a_kind?
#       three_kind_compare
#     when two_pair?
#       two_pair_compare
#     when pair?
#       pair_compare
#     when royal_flush?, straight_flush?, straight?
#       hand1.cards.max <=> hand2.cards.max
#     else
#       each_card_compare(hand1, hand2)
#     end
#   end

#   def high_card_in_set_of(num)
#     matches = cards.select { |card| cards.count(card) == num }
#     matches.map!(&:value).max
#   end

#   def lower_pair
#     matches = cards.select { |card| cards.count(card) == 2 }
#     matches.map!(&:value).min
#   end

#   def four_kind_compare(hand1, hand2)
#     hand1.high_card_in_set_of(4) <=> hand2.high_card_in_set_of(4)
#   end

#   def full_house_compare(hand1, hand2)
#     compare_val = hand1.high_card_in_set_of(3) <=> hand2.high_card_in_set_of(3)
#     return compare_val unless compare_val.zero?
#     hand1.high_card_in_set_of(2) <=> hand2.high_card_in_set_of(2)
#   end

#   def three_kind_compare(hand1,hand2)
#     hand1.high_card_in_set_of(3) <=> hand2.high_card_in_set_of(3)
#   end

#   def two_pair_compare(hand1, hand2)
#     compare_val = hand1.high_card_in_set_of(2) <=> hand2.high_card_in_set_of(2)
#     compare_val = hand1.lower_pair <=> hand2.lower_pair if compare_val.zero?
#     return compare_val unless compare_val.zero?
#     hand1.high_card_in_set_of(1) <=> hand2.high_card_in_set_of(1)
#   end

#   def pair_compare(hand1, hand2)
#     compare_val = hand1.high_card_in_set_of(2) <=> hand2.high_card_in_set_of(2)
#     return compare_val unless compare_val.zero?
#     hand1.high_card_in_set_of(1) <=> hand2.high_card_in_set_of(1)
#   end

#   def each_card_compare(hand1, hand2)
#     hi_to_lo_hand1 = hand1.cards.sort.reverse
#     hi_to_lo_hand2 = hand2.cards.sort.reverse

#     compare_val = nil
#     hi_to_lo_hand1.each_with_index do |card, idx|
#       compare_val = card <=> hi_to_lo_hand2[idx]
#       return compare_val unless compare_val.zero?
#     end
#     compare_val
#   end
# end

# def display_best_hand(hand1, hand2)
#   if hand1 == hand2
#     puts "Both hands are the exact same #{hand1.evaluate} hand!"
#     hand1.print
#     puts
#     hand2.print
#     return
#   end

#   puts 'Best Hand:'
#   if hand1 > hand2
#     puts "(#{hand1.evaluate})"
#     hand1.print
#   else
#     puts "(#{hand2.evaluate})"
#     hand2.print
#   end
# end

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# hand1 = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])

# hand2 = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])

# hand3 = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])

# hand4 = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])

# hand5 = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])

# hand6 = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])

# hand7 = PokerHand.new([
#   Card.new(6,      'Hearts'),
#   Card.new('Ace', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])

# hand8 = PokerHand.new([
#   Card.new(4,      'Hearts'),
#   Card.new('Jack', 'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(5,      'Spades'),
#   Card.new(2,      'Diamonds')
# ])

# hand9 = PokerHand.new([
#   Card.new(4,      'Hearts'),
#   Card.new('Jack', 'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(5,      'Spades'),
#   Card.new(2,      'Diamonds')
# ])

# hand10 = PokerHand.new([
#   Card.new(4,      'Spades'),
#   Card.new('Jack', 'Diamonds'),
#   Card.new(9,      'Clubs'),
#   Card.new(5,      'Hearts'),
#   Card.new(2,      'Diamonds')
# ])

# display_best_hand(hand1, hand2)
# puts
# display_best_hand(hand3, hand4)
# puts
# display_best_hand(hand5, hand6)
# puts
# display_best_hand(hand6, hand7)
# puts
# display_best_hand(hand8, hand9)

# Question 3 (best 5 cards out of 7):
# class PokerHand
#   include Comparable

#   HAND_VALUES = {
#     'High card'       => 1,
#     'Pair'            => 2,
#     'Two pair'        => 3,
#     'Three of a kind' => 4,
#     'Straight'        => 5,
#     'Flush'           => 6,
#     'Full house'      => 7,
#     'Four of a kind'  => 8,
#     'Straight flush'  => 9,
#     'Royal flush'     => 10
#   }.freeze

#   def initialize(cards)
#     @cards = []
#     @rank_count = Hash.new(0)

#     7.times do
#       card = cards.draw
#       if card
#         @cards << card
#         @rank_count[card.rank] += 1
#       end
#     end
#   end

#   def print_best_five
#     hand = best_five_of_seven
#     puts "Best five-card hand:"
#     puts "(#{hand})"
#     puts hand.cards.sort
#     puts
#   end

#   def evaluate
#     if    royal_flush?     then 'Royal flush'
#     elsif straight_flush?  then 'Straight flush'
#     elsif four_of_a_kind?  then 'Four of a kind'
#     elsif full_house?      then 'Full house'
#     elsif flush?           then 'Flush'
#     elsif straight?        then 'Straight'
#     elsif three_of_a_kind? then 'Three of a kind'
#     elsif two_pair?        then 'Two pair'
#     elsif pair?            then 'Pair'
#     else 'High card'
#     end
#   end

#   def <=>(other_hand)
#     compare_value = HAND_VALUES[self.evaluate] <=> HAND_VALUES[other_hand.evaluate]
#     return best_hand(self, other_hand) if compare_value.zero?
#     compare_value
#   end

#   def to_s
#     evaluate
#   end

#   protected

#   attr_reader :cards

#   private

#   def best_five_of_seven
#     five_card_hands = cards.combination(5).to_a
#     five_card_hands.map! { |hand| PokerHand.new(hand) }

#     better_hand = five_card_hands[0]
#     five_card_hands.each do |next_hand|
#       if better_hand < next_hand
#         better_hand = next_hand
#       end
#     end
#     better_hand
#   end

#   def flush?
#     suit = cards.first.suit
#     cards.all? { |card| card.suit == suit }
#   end

#   def straight?
#     return false if @rank_count.any? { |_, count| count > 1 }

#     cards.min.value == cards.max.value - 4
#   end

#   def n_of_a_kind?(number)
#     @rank_count.one? { |_, count| count == number }
#   end

#   def straight_flush?
#     flush? && straight?
#   end

#   def royal_flush?
#     straight_flush? && cards.min.rank == 10
#   end

#   def four_of_a_kind?
#     n_of_a_kind?(4)
#   end

#   def full_house?
#     n_of_a_kind?(3) && n_of_a_kind?(2)
#   end

#   def three_of_a_kind?
#     n_of_a_kind?(3)
#   end

#   def two_pair?
#     @rank_count.select { |_, count| count == 2 }.size == 2
#   end

#   def pair?
#     n_of_a_kind?(2)
#   end

#   def best_hand(hand1, hand2)
#     case hand1.evaluate
#     when four_of_a_kind?
#       four_kind_compare
#     when full_house?
#       full_house_compare
#     when three_of_a_kind?
#       three_kind_compare
#     when two_pair?
#       two_pair_compare
#     when pair?
#       pair_compare
#     when royal_flush?, straight_flush?, straight?
#       hand1.cards.max <=> hand2.cards.max
#     else
#       each_card_compare(hand1, hand2)
#     end
#   end

#   def high_card_in_set_of(num)
#     matches = cards.select { |card| cards.count(card) == num }
#     matches.map!(&:value).max
#   end

#   def lower_pair
#     matches = cards.select { |card| @cards.count(card) == 2 }
#     matches.map!(&:value).min
#   end

#   def four_kind_compare(hand1, hand2)
#     hand1.high_card_in_set_of(4) <=> hand2.high_card_in_set_of(4)
#   end

#   def full_house_compare(hand1, hand2)
#     compare_val = hand1.high_card_in_set_of(3) <=> hand2.high_card_in_set_of(3)
#     return compare_val unless compare_val.zero?
#     hand1.high_card_in_set_of(2) <=> hand2.high_card_in_set_of(2)
#   end

#   def three_kind_compare(hand1,hand2)
#     hand1.high_card_in_set_of(3) <=> hand2.high_card_in_set_of(3)
#   end

#   def two_pair_compare(hand1, hand2)
#     compare_val = hand1.high_card_in_set_of(2) <=> hand2.high_card_in_set_of(2)
#     compare_val = hand1.lower_pair <=> hand2.lower_pair if compare_val.zero?
#     return compare_val unless compare_val.zero?
#     hand1.high_card_in_set_of(1) <=> hand2.high_card_in_set_of(1)
#   end

#   def pair_compare(hand1, hand2)
#     compare_val = hand1.high_card_in_set_of(2) <=> hand2.high_card_in_set_of(2)
#     return compare_val unless compare_val.zero?
#     hand1.high_card_in_set_of(1) <=> hand2.high_card_in_set_of(1)
#   end

#   def each_card_compare(hand1, hand2)
#     hi_to_lo_hand1 = hand1.cards.sort.reverse
#     hi_to_lo_hand2 = hand2.cards.sort.reverse

#     compare_val = nil
#     hi_to_lo_hand1.each_with_index do |card, idx|
#       compare_val = card <=> hi_to_lo_hand2[idx]
#       return compare_val unless compare_val.zero?
#     end
#     compare_val
#   end
# end

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts'),
#   Card.new(2,       'Hearts'),
#   Card.new('Ace',   'Clubs')
# ])
# hand.print_best_five # => Royal flush

# hand = PokerHand.new([
#   Card.new(9,  'Hearts'),
#   Card.new(9,  'Clubs'),
#   Card.new(5,  'Diamonds'),
#   Card.new(8,  'Hearts'),
#   Card.new(5,  'Hearts'),
#   Card.new(7,  'Hearts'),
#   Card.new(10, 'Hearts'),
# ])
# hand.print_best_five # => Flush

# hand = PokerHand.new([
#   Card.new(9,  'Hearts'),
#   Card.new(9,  'Clubs'),
#   Card.new(5,  'Diamonds'),
#   Card.new(8,  'Spades'),
#   Card.new(5,  'Clubs'),
#   Card.new(7,  'Spades'),
#   Card.new(10, 'Hearts'),
# ])
# hand.print_best_five # => Two pair

# hand = PokerHand.new([
#   Card.new(3,     'Hearts'),
#   Card.new(9,     'Clubs'),
#   Card.new(7,     'Diamonds'),
#   Card.new(8,     'Spades'),
#   Card.new(2,     'Clubs'),
#   Card.new('Ace', 'Spades'),
#   Card.new(10,    'Hearts'),
# ])
# hand.print_best_five # => High card (Should be Ace-high)
