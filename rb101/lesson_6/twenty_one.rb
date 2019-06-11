DECK = { '2H' => 2, '2C' => 2, '2S' => 2, '2D' => 2,
         '3H' => 3, '3C' => 3, '3S' => 3, '3D' => 3,
         '4H' => 4, '4C' => 4, '4S' => 4, '4D' => 4,
         '5H' => 5, '5C' => 5, '5S' => 5, '5D' => 5,
         '6H' => 6, '6C' => 6, '6S' => 6, '6D' => 6,
         '7H' => 7, '7C' => 7, '7S' => 7, '7D' => 7,
         '8H' => 8, '8C' => 8, '8S' => 8, '8D' => 8,
         '9H' => 9, '9C' => 9, '9S' => 9, '9D' => 9,
         '10H' => 10, '10C' => 10, '10S' => 10, '10D' => 10,
         'JH' => 10, 'JC' => 10, 'JS' => 10, 'JD' => 10,
         'QH' => 10, 'QC' => 10, 'QS' => 10, 'QD' => 10,
         'KH' => 10, 'KC' => 10, 'KS' => 10, 'KD' => 10,
         'AH' => 11, 'AC' => 11, 'AS' => 11, 'AD' => 11 }
CARD_TOTAL_LIMIT = 21
DEALER_LIMIT = 17
LINE_BREAK = '===================='
GAME_SCORE_LIMIT = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  DECK.clone
end

def display_welcome
  system 'clear'
  prompt "Welcome to Twenty-One!"
  prompt "First to #{GAME_SCORE_LIMIT} wins!"
  prompt "Let's shuffle up and deal!"
  sleep 1.5
end

def deal!(deck, number_of_cards)
  hand = deck.to_a.shuffle.shift(number_of_cards).to_h
  deck.delete_if { |name| hand.key?(name) }
  hand
end

def initialize_player_hand(deck)
  deal!(deck, 2)
end

def initialize_dealer_hand(deck)
  hand = deal!(deck, 1)
  hand['?'] = 0
  hand
end

def aces_values!(cards)
  cards.each_key do |name|
    if cards.values.sum > CARD_TOTAL_LIMIT && name.start_with?(/A/)
      cards[name] = 1
    end
  end
  cards
end

def total(cards)
  hand = aces_values!(cards)
  hand.values.sum
end

def card_list(cards)
  cards.keys.join(', ')
end

def display_game_score(dealer_score, player_score)
  system 'clear'
  prompt "Dealer Score: #{dealer_score} | Player Score: #{player_score}"
end

def display_hands(dealer_hand, player_hand, dealer_total, player_total)
  puts LINE_BREAK
  prompt "Dealer has: #{card_list(dealer_hand)} (TOTAL: #{dealer_total})"
  prompt "You have: #{card_list(player_hand)} (TOTAL: #{player_total})"
end

def display_choice(answer, participant)
  choice = answer.start_with?('h') ? 'hit' : 'stay'
  puts LINE_BREAK
  prompt "#{participant} #{choice}s!"
  sleep 1
end

def hit!(hand, deck)
  hand.merge!(deal!(deck, 1))
end

def reveal_card!(dealer_hand, deck)
  dealer_hand.delete('?')
  hit!(dealer_hand, deck)
end

def busted?(hand)
  hand > CARD_TOTAL_LIMIT
end

def game_won?(dealer_score, player_score)
  dealer_score >= GAME_SCORE_LIMIT || player_score >= GAME_SCORE_LIMIT
end

def detect_result(dealer_total, player_total)
  if busted?(player_total)
    :player_busted
  elsif busted?(dealer_total)
    :dealer_busted
  elsif player_total > dealer_total
    :player_wins
  elsif player_total < dealer_total
    :dealer_wins
  else
    :push
  end
end

def detect_round_winner(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)
  if [:player_busted, :dealer_wins].include?(result)
    'dealer'
  elsif [:dealer_busted, :player_wins].include?(result)
    'player'
  end
end

def detect_grand_winner(dealer_score, player_score)
  if dealer_score >= GAME_SCORE_LIMIT
    'dealer'
  elsif player_score >= GAME_SCORE_LIMIT
    'player'
  end
end

def display_round_result(dealer_total, player_total)
  puts LINE_BREAK
  result = detect_result(dealer_total, player_total)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player_wins
    prompt "Congratulations! You've won!"
  when :dealer_wins
    prompt "Sorry! Dealer won!"
  when :push
    prompt "Push!"
  end
  sleep 2.5
end

def display_final_result(dealer_score, player_score)
  grand_winner = detect_grand_winner(dealer_score, player_score)
  display_game_score(dealer_score, player_score)
  prompt "The #{grand_winner} is the GRAND WINNER!"
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp.downcase
  answer.start_with?('y') ? true : false
end

def display_goodbye
  puts LINE_BREAK
  prompt "Thank you for playing Twenty-One! Good bye!"
  sleep 1.5
  system 'clear'
end

display_welcome

loop do
  dealer_score = 0
  player_score = 0

  until game_won?(player_score, dealer_score)
    deck = initialize_deck

    dealer = initialize_dealer_hand(deck)
    player = initialize_player_hand(deck)

    dealer_total = total(dealer)
    player_total = total(player)

    display_game_score(dealer_score, player_score)

    until busted?(player_total)
      display_hands(dealer, player, dealer_total, player_total)

      prompt "Would you like to (h)it or (s)tay?"
      player_choice = gets.chomp.downcase

      if player_choice.start_with?('s', 'h')
        display_choice(player_choice, 'Player')
      else
        prompt "Invalid choice!"
      end

      if player_choice.start_with?('s')
        break
      elsif player_choice.start_with?('h')
        hit!(player, deck)
        player_total = total(player)
      end
    end

    unless busted?(player_total)
      display_game_score(dealer_score, player_score)

      reveal_card!(dealer, deck)
      dealer_total = total(dealer)

      until dealer_total >= DEALER_LIMIT
        display_hands(dealer, player, dealer_total, player_total)
        display_choice('hit', 'Dealer')
        hit!(dealer, deck)
        dealer_total = total(dealer)
        sleep 1
      end
    end

    display_hands(dealer, player, dealer_total, player_total)

    round_winner = detect_round_winner(dealer_total, player_total)
    dealer_score += 1 if round_winner == 'dealer'
    player_score += 1 if round_winner == 'player'

    display_round_result(dealer_total, player_total)
  end

  display_final_result(dealer_score, player_score)
  break unless play_again?
end

display_goodbye
