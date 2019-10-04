module TwentyOne
  module Hand
    CARD_TOTAL_LIMIT = 21

    def show_hand
      cards.map(&:to_s).join(', ')
    end

    def card_total
      total = cards.map(&:to_card_value).sum

      cards.select(&:ace?).each do |_|
        break if total <= CARD_TOTAL_LIMIT
        total -= 10
      end

      total
    end

    def busted?
      card_total > CARD_TOTAL_LIMIT
    end

    def add_card(deck)
      cards << deck.deal_card
    end
  end

  class Participant
    include Hand

    attr_accessor :name, :cards, :score

    def initialize
      @cards = reset_hand
      @score = reset_score
    end

    def reset_hand
      self.cards = []
    end

    def reset_score
      self.score = 0
    end

    def hit(deck)
      add_card(deck)
      puts "#{self} hits!"
    end

    def stay
      puts "#{self} stays!"
    end

    def to_s
      name
    end
  end

  class Player < Participant
    def choose_name
      answer = nil
      loop do
        puts 'Please enter your name:'
        answer = gets.chomp
        break if answer =~ /^[a-zA-Z][\w\s]*[\w]+$/
        puts 'Invalid entry!'
      end
      self.name = answer
    end
  end

  class Dealer < Participant
    CPU_NAMES = %w(Alpha-5 Sonny Chappie Wall-E C-3PO).freeze

    def initialize
      super
      @name = CPU_NAMES.sample
    end
  end

  class Deck
    def initialize
      @cards = reset
    end

    def deal_card
      @cards.pop
    end

    def reset
      @cards = set_up
      @cards.shuffle!
    end

    private

    def set_up
      deck = []
      Card::SUITS.each do |suit|
        Card::FACES.each do |face|
          deck << Card.new(suit, face)
        end
      end
      deck
    end
  end

  class Card
    SUITS = %w(S H C D).freeze
    FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze

    def initialize(suit, face)
      @suit = suit
      @face = face
    end

    def ace?
      face == 'Ace'
    end

    def to_card_value
      case face
      when 'Ace' then 11
      when 'Jack', 'Queen', 'King' then 10
      else
        face.to_i
      end
    end

    def to_s
      "The #{face} of #{suit}"
    end

    private

    def face
      case @face
      when 'J' then 'Jack'
      when 'Q' then 'Queen'
      when 'K' then 'King'
      when 'A' then 'Ace'
      else
        @face
      end
    end

    def suit
      case @suit
      when 'S' then 'Spades'
      when 'H' then 'Hearts'
      when 'C' then 'Clubs'
      when 'D' then 'Diamonds'
      end
    end
  end

  # Game Orchestration Engine:
  class TwentyOneGame
    SCORE_LIMIT = 5
    VALID_MOVES = %w(hit stay).freeze
    DEALER_MUST_HIT_TOTAL = 17

    def initialize
      @player = Player.new
      @dealer = Dealer.new
      @deck = Deck.new
      @card_reveal = nil
    end

    def play
      start_game
      loop do
        reset_score
        shuffle_up_and_deal
        play_game
        display_grand_winner
        break unless play_again?
      end
      display_goodbye
    end

    private

    attr_reader :player, :dealer, :deck
    attr_accessor :card_reveal

    def clear
      system 'clear'
    end

    def pause
      sleep 1.5
    end

    def display_welcome
      clear
      puts 'Welcome to Twenty-One!'
      pause
    end

    def enter_to_continue
      puts
      loop do
        puts '(Please press ENTER to continue)'
        answer = gets.chomp
        break if answer.empty?
        puts 'Sorry, invalid choice!'
      end
    end

    def display_rules
      clear
      puts 'RULES:'
      puts "=> The player with the highest card total WITHOUT " \
           "going over #{Hand::CARD_TOTAL_LIMIT} is the winner " \
           "of that round."
      puts "=> The Dealer must hit if their card total is below " \
            "#{DEALER_MUST_HIT_TOTAL}."
      puts "=> First player to reach #{SCORE_LIMIT} wins is " \
           "crowned the Grand Winner."
      enter_to_continue
      clear
    end

    def display_greeting
      clear
      puts "Hi #{player},"
      puts
      puts "Today your dealer will be #{dealer}."
      puts
      puts 'Good luck!'
      pause
    end

    def start_game
      display_welcome
      display_rules
      player.choose_name
      display_greeting
    end

    def reset_score
      player.reset_score
      dealer.reset_score
    end

    def shuffle_up_and_deal
      clear
      puts "Let's shuffle up and deal!"
      pause
    end

    def reset_round
      deck.reset
      player.reset_hand
      dealer.reset_hand
    end

    def hide_dealer_card
      self.card_reveal = false
    end

    def deal_initial_cards
      dealer.cards << deck.deal_card << deck.deal_card
      hide_dealer_card
      player.cards << deck.deal_card << deck.deal_card
    end

    def display_score
      puts "Score: #{player} - #{player.score}, " \
           "#{dealer} - #{dealer.score}"
      puts
    end

    def display_dealer_cards
      puts "------#{dealer}'s hand------"
      if card_reveal
        puts dealer.show_hand
        puts "=> Total: #{dealer.card_total}"
      else
        puts "#{dealer.cards.first}, ??"
        puts "=> Total: ??"
      end
    end

    def display_player_cards
      puts "------#{player}'s hand------"
      puts player.show_hand
      puts "=> Total: #{player.card_total}"
    end

    def display_cards
      display_dealer_cards
      puts
      display_player_cards
      puts
    end

    def display_game
      clear
      display_score
      display_cards
    end

    def hit_or_stay
      choice = nil
      loop do
        puts 'Would you like to hit or stay? ' \
             "(any abbreviation of 'hit' or 'stay' is acceptable)"
        choice = gets.chomp.downcase
        break if VALID_MOVES.any? { |move| move.start_with?(choice) } &&
                 !choice.empty?
        puts "Invalid choice!"
      end
      choice.start_with?('h') ? 'hit' : 'stay'
    end

    def player_turn
      loop do
        display_game
        puts
        player_move = hit_or_stay
        if player_move == 'hit'
          player.hit(deck)
          pause
        elsif player_move == 'stay'
          player.stay
          pause
          break
        end
        break if player.busted?
      end
    end

    def reveal_dealer_card
      self.card_reveal = true
    end

    def dealer_turn
      reveal_dealer_card
      loop do
        display_game
        if dealer.card_total < DEALER_MUST_HIT_TOTAL
          dealer.hit(deck)
          pause
          next
        end
        break if dealer.busted?
        dealer.stay
        pause
        break
      end
    end

    def someone_busted?
      player.busted? || dealer.busted?
    end

    def display_busted
      busted_player = player.busted? ? player : dealer
      puts "#{busted_player} busted!"
    end

    def determine_round_winner
      if someone_busted?
        player.busted? ? dealer : player
      elsif player.card_total > dealer.card_total
        player
      elsif player.card_total < dealer.card_total
        dealer
      end
    end

    def record_round_result
      winner = determine_round_winner
      winner.score += 1 if winner
    end

    def display_round_result
      winner = determine_round_winner
      if winner
        puts "#{winner} won!"
      else
        puts 'Push!'
      end
    end

    def record_and_display_round_result
      clear
      record_round_result
      reveal_dealer_card if player.busted?
      display_game
      display_busted if someone_busted?
      display_round_result
      enter_to_continue unless grand_winner?
    end

    def grand_winner?
      player.score >= SCORE_LIMIT || dealer.score >= SCORE_LIMIT
    end

    def determine_grand_winner
      player.score >= SCORE_LIMIT ? player : dealer
    end

    def display_grand_winner
      grand_winner = determine_grand_winner
      puts
      puts "#{grand_winner} is the Grand Winner!"
      puts
    end

    def play_round
      reset_round
      deal_initial_cards
      player_turn
      return if someone_busted?
      dealer_turn
    end

    def play_game
      loop do
        play_round
        record_and_display_round_result
        break if grand_winner?
      end
    end

    def play_again?
      choice = nil
      loop do
        puts 'Would you like to play again? (y/n)'
        choice = gets.chomp.downcase
        break if choice.start_with?('y', 'n')
        puts 'Invalid response!'
      end
      choice.start_with?('y')
    end

    def display_goodbye
      clear
      puts "Thanks for playing Twenty-One, #{player}! Good bye!"
      pause
      clear
    end
  end
end

TwentyOne::TwentyOneGame.new.play
