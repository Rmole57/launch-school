require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
SCORE_LIMIT = 5
VALID_FIRST_MOVE_OPTIONS = ['player', 'computer', 'choose']
FIRST_MOVE = 'choose'

def valid_first_move_setting?
  unless VALID_FIRST_MOVE_OPTIONS.include?(FIRST_MOVE)
    raise "FIRST_MOVE setting must be either 'player', 'computer', or 'choose'!"
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome
  system 'clear'
  prompt "Welcome to Tic Tac Toe!"
  prompt "First to 5 wins!"
  sleep 3
end

def choose_first_move
  if FIRST_MOVE == 'choose'
    choice = ''
    loop do
      system 'clear'
      prompt 'Do you want to go first? (y or n)'
      choice = gets.chomp.downcase
      break if choice.start_with?(/y/, /n/)
      prompt "Sorry, invalid choice!"
      sleep 2
    end
    choice == 'y' ? 'player' : 'computer'
  else
    FIRST_MOVE
  end
end

def display_first_turn(player)
  system 'clear'
  prompt "The #{player} will now go first!"
  sleep 2
end

def display_score(player_score, computer_score)
  prompt "Current Score - Player: #{player_score}, Computer: #{computer_score}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter = ', ', last_word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{last_word} ")
  else
    arr[-1] = "#{last_word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece (#{joinor(empty_squares(brd))}):"
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) &&
             square == square.to_i.to_s
    prompt "Sorry, that's not a valid choice."
  end
  brd[square.to_i] = PLAYER_MARKER
end

def final_square?(brd, line, marker)
  brd.values_at(*line).count(marker) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
end

def find_at_risk_line(brd)
  WINNING_LINES.each do |line|
    return line if final_square?(brd, line, COMPUTER_MARKER)
  end
  WINNING_LINES.each do |line|
    return line if final_square?(brd, line, PLAYER_MARKER)
  end
  nil
end

def fill_last_square(brd)
  line = find_at_risk_line(brd)
  line.find { |square| brd[square] == INITIAL_MARKER }
end

def computer_places_piece!(brd)
  square = if find_at_risk_line(brd)
             fill_last_square(brd)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  elsif player == 'computer'
    computer_places_piece!(brd)
  else
    raise "Second parameter must be 'player' or 'computer'!"
  end
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end
  nil
end

def grand_winner?(score1, score2)
  score1 >= SCORE_LIMIT || score2 >= SCORE_LIMIT
end

def display_result(brd, player_score, computer_score)
  display_score(player_score, computer_score)
  if someone_won?(brd)
    if grand_winner?(player_score, computer_score)
      prompt "The #{detect_winner(brd)} is the GRAND WINNER!"
    else
      prompt "The #{detect_winner(brd)} won the round!"
    end
  else
    prompt "It's a tie!"
  end
  sleep 2
end

def display_end_of_round(brd, player_score, computer_score)
  display_board(brd)
  display_result(brd, player_score, computer_score)
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y') ? true : false
end

def display_goodbye
  prompt "Thanks for playing Tic Tac Toe! Good bye!"
  sleep 2
  system 'clear'
end

valid_first_move_setting?
display_welcome

loop do
  player_score = 0
  computer_score = 0

  current_player = choose_first_move

  until grand_winner?(player_score, computer_score)
    display_first_turn(current_player)
    board = initialize_board

    loop do
      display_board(board)
      display_score(player_score, computer_score)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    case detect_winner(board)
    when 'player'   then player_score += 1
    when 'computer' then computer_score += 1
    end

    display_end_of_round(board, player_score, computer_score)
  end

  break unless play_again?
end

display_goodbye
