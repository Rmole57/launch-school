class Card
  include Comparable
  attr_reader :rank, :suit

  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10,
          'Jack', 'Queen', 'King', 'Ace'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    RANKS.index(rank) <=> RANKS.index(other_card.rank)
  end

  # The method below is just to demonstrate that
  # if we didn't mix in Comparable, we'd have to
  # define this method for our tests to pass (though
  # this design would be incredibly inefficient since,
  # if we're defining #== and #<=> methods, we'd most
  # likely be using the other comparison operators as
  # well. And since we're already defining #<=>, mixing
  # in Comparable would just take care of defining all
  # of those other comparison operators for us!):

  # def ==(other_card)
  #   (self <=> other_card) == 0
  # end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

# ALTERNATIVE SOLUTION:

# class Card
#   include Comparable
#   attr_reader :rank, :suit

#   VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   def value
#     VALUES.fetch(rank, rank)
#   end

#   def <=>(other_card)
#     value <=> other_card.value
#   end
# end

# FURTHER EXPLORATION:

# class Card
#   include Comparable
#   attr_reader :rank, :suit

#   RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
#   SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   def rank_value
#     RANK_VALUES.fetch(rank, rank)
#   end

#   def suit_value
#     SUIT_VALUES.fetch(suit)
#   end

#   def <=>(other_card)
#     if rank_value == other_card.rank_value
#       suit_value <=> other_card.suit_value
#     else
#       rank_value <=> other_card.rank_value
#     end
#   end
# end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min == Card.new(4, 'Diamonds')
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max == Card.new('Jack', 'Spades')

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min == Card.new(8, 'Diamonds')
# puts cards.max == Card.new(8, 'Spades')
