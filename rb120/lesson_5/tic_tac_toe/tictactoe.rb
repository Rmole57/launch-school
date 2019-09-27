module TicTacToe
  class Board
    WINNING_LINES = {
      rows:      [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
      columns:   [[1, 4, 7], [2, 5, 8], [3, 6, 9]],
      diagonals: [[1, 5, 9], [3, 5, 7]]
    }
    LINE_SIZE = 3

    attr_reader :squares

    def initialize
      @squares = {}
      reset
    end

    def [](num)
      squares[num]
    end

    def []=(num, marker)
      squares[num].marker = marker
    end

    def unmarked_keys
      squares.keys.select { |key| squares[key].unmarked? }
    end

    def full?
      unmarked_keys.empty?
    end

    def someone_won?
      !!winning_marker
    end

    def winning_marker
      WINNING_LINES.each do |_axis, lines|
        lines.each do |line|
          line_squares = squares.values_at(*line)
          if identical_markers?(line_squares, LINE_SIZE)
            return line_squares.first.marker
          end
        end
      end
      nil
    end

    def reset
      (1..9).each { |key| squares[key] = Square.new }
    end

    def line_at_risk?(line_squares, marker)
      markers = collect_markers(line_squares)
      identical_markers?(line_squares, LINE_SIZE - 1) && markers.max == marker
    end

    # rubocop:disable Metrics/AbcSize
    def draw
      puts "     |     |"
      puts " #{squares[1]}   |  #{squares[2]}  |  #{squares[3]}"
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts " #{squares[4]}   |  #{squares[5]}  |  #{squares[6]}"
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts " #{squares[7]}   |  #{squares[8]}  |  #{squares[9]}"
      puts "     |     |"
    end
    # rubocop:enable Metrics/AbcSize

    private

    def collect_markers(line_squares)
      line_squares.select(&:marked?).collect(&:marker)
    end

    def identical_markers?(line_squares, num)
      markers = collect_markers(line_squares)
      markers.size == num && markers.min == markers.max
    end
  end

  class Square
    INITIAL_MARKER = ' '

    attr_accessor :marker

    def initialize(marker = INITIAL_MARKER)
      @marker = marker
    end

    def to_s
      marker
    end

    def unmarked?
      marker == INITIAL_MARKER
    end

    def marked?
      marker != INITIAL_MARKER
    end
  end

  class Player
    VALID_MARKERS = %w(X O).freeze

    attr_accessor :name, :marker, :score, :board

    def initialize(board)
      @marker = nil
      @score = reset_score
      @board = board
    end

    def reset_score
      self.score = 0
    end
  end

  class Human < Player
    def choose_name
      choice = nil
      loop do
        puts "What's your name?"
        choice = gets.chomp
        break if choice =~ /^\w/
        puts "Invalid answer!"
      end
      self.name = choice
    end

    def choose_marker
      choice = nil
      loop do
        puts "Would you like to be an 'X' or an 'O'?"
        choice = gets.chomp.upcase
        break if VALID_MARKERS.include?(choice)
        puts "Invalid choice! Please choose either 'X' or 'O'!"
      end
      self.marker = choice
    end

    def move
      square = nil
      loop do
        puts "Choose a square (#{joinor(board.unmarked_keys)}): "
        square = gets.chomp
        break if valid_square_choice?(square)
        puts "Sorry, that's not a valid choice."
      end
      board[square.to_i] = marker
    end

    private

    def joinor(arr, delimiter = ', ', join_wrd = 'or')
      case arr.size
      when 0 then ''
      when 1 then arr.first
      when 2 then arr.join(" #{join_wrd} ")
      else
        arr[-1] = "#{join_wrd} #{arr.last}"
        arr.join(delimiter.to_s)
      end
    end

    def valid_square_choice?(square)
      board.unmarked_keys.include?(square.to_i) &&
        square.to_i.to_s == square
    end
  end

  class Computer < Player
    COMPUTER_NAMES = %w(Alpha-5 Sonny Chappie Wall-E C-3PO).freeze

    def initialize(board)
      super
      @name = COMPUTER_NAMES.sample
    end

    def choose_marker(other_marker)
      self.marker = (VALID_MARKERS - [other_marker]).first
    end

    def move
      square = best_square_option
      square.marker = marker
    end

    private

    def find_at_risk_square(marker)
      Board::WINNING_LINES.each do |_axis, lines|
        lines.each do |line|
          line_squares = board.squares.values_at(*line)
          if board.line_at_risk?(line_squares, marker)
            return line.select { |key| board.unmarked_keys.include?(key) }.first
          end
        end
      end
      nil
    end

    def cpu_offense
      find_at_risk_square(marker)
    end

    def cpu_defense
      other_marker = (VALID_MARKERS - [marker]).first
      find_at_risk_square(other_marker)
    end

    def best_square_option
      best_square = if board[5].unmarked?
                      5
                    elsif cpu_offense
                      cpu_offense
                    elsif cpu_defense
                      cpu_defense
                    else
                      board.unmarked_keys.sample
                    end
      board[best_square]
    end
  end

  class ValidateFirstMoveError < StandardError
    def to_s
      "FIRST_MOVE setting must be either 'human', 'computer', or 'choose'!"
    end
  end

  # Game Orchestration Engine:
  class TTTGame
    VALID_FIRST_MOVES = %w(human computer choose).freeze
    FIRST_MOVE = 'choose'
    SCORE_LIMIT = 5

    def initialize
      @board = Board.new
      @human = Human.new(board)
      @computer = Computer.new(board)
      @current_marker = FIRST_MOVE
    end

    def play
      start_of_game
      loop do
        reset_game
        play_main_game
        end_of_game
        break unless play_again?
        display_play_again_message
      end
      display_goodbye_message
    end

    private

    attr_reader :board, :human, :computer

    def clear
      system 'clear'
    end

    def valid_first_move_setting?
      raise ValidateFirstMoveError unless VALID_FIRST_MOVES.include?(FIRST_MOVE)
    end

    def display_welcome_message
      clear
      puts 'Welcome to Tic Tac Toe!'
      sleep 1
    end

    def display_rules
      clear
      puts 'RULES:'
      puts "=> First to #{SCORE_LIMIT} wins!"
      puts '=> LOSER of each round goes FIRST the following round.'
      puts '=> In the event of a tie, the LAST PLAYER to go FIRST ' \
           'will go SECOND in the following round.'
      puts
      loop do
        puts '(Please press ENTER to continue)'
        answer = gets.chomp
        break if answer == ''
        puts 'Invalid response!'
      end
      clear
    end

    def display_game_greeting
      clear
      puts "Hi, #{human.name}! Today you'll be facing off " \
           "against #{computer.name}!"
      sleep 2
      clear
    end

    def choose_markers
      human.choose_marker
      computer.choose_marker(human.marker)
    end

    def start_of_game
      valid_first_move_setting?
      display_welcome_message
      display_rules
      human.choose_name
      display_game_greeting
      choose_markers
    end

    def determine_first_move
      clear
      choice = nil
      loop do
        puts 'Would you like to go first? (y/n)'
        choice = gets.chomp.downcase
        break if choice.start_with?('y', 'n')
        puts "Sorry, invalid choice!"
      end
      choice.start_with?('y') ? human.marker : computer.marker
    end

    def first_move_set?
      FIRST_MOVE != 'choose'
    end

    def initialize_first_move
      return determine_first_move unless first_move_set?
      case FIRST_MOVE
      when 'human'    then human.marker
      when 'computer' then computer.marker
      end
    end

    def reset_game
      board.reset
      human.reset_score
      computer.reset_score
      @current_marker = initialize_first_move
    end

    def display_turn
      clear
      player_turn = @current_marker == human.marker ? human : computer
      puts "It's #{player_turn.name}'s turn!"
      sleep 1.5
    end

    def reset_round
      board.reset
      display_turn
    end

    def display_score
      puts "Score: #{human.name} - #{human.score}, " \
           "#{computer.name} - #{computer.score}"
    end

    def display_board
      puts "#{human.name} is a '#{human.marker}'. " \
           "#{computer.name} is a '#{computer.marker}'."
      puts
      board.draw
      puts
    end

    def display_game
      clear
      display_score
      display_board
    end

    def human_turn?
      @current_marker == human.marker
    end

    def current_player_moves
      if human_turn?
        human.move
        @current_marker = computer.marker
      else
        computer.move
        @current_marker = human.marker
      end
    end

    def play_round
      loop do
        display_game
        current_player_moves
        break if board.someone_won? || board.full?
      end
    end

    def record_round_result
      case board.winning_marker
      when human.marker    then human.score += 1
      when computer.marker then computer.score += 1
      end
    end

    def display_round_result
      case board.winning_marker
      when human.marker
        puts "#{human.name} won this round!"
      when computer.marker
        puts "#{computer.name} won this round!"
      else
        puts "It's a tie!"
      end
    end

    def record_and_display_round_result
      record_round_result
      display_game
      display_round_result
      sleep 2
    end

    def grand_winner?
      human.score >= SCORE_LIMIT || computer.score >= SCORE_LIMIT
    end

    def play_main_game
      loop do
        reset_round
        play_round
        record_and_display_round_result
        break if grand_winner?
      end
    end

    def display_grand_winner
      grand_winner = human.score >= SCORE_LIMIT ? human : computer

      clear
      display_score
      puts "#{grand_winner.name} is the Grand Winner!"
      puts
    end

    def end_of_game
      clear
      display_score
      display_grand_winner
    end

    def play_again?
      answer = nil
      loop do
        puts "Would you like to play again? (y/n)"
        answer = gets.chomp.downcase
        break if %(y n).include?(answer) && !answer.empty?
        puts "Sorry, must be y or n"
      end
      answer == 'y'
    end

    def display_play_again_message
      clear
      puts "Let's play again!"
      sleep 1
    end

    def display_goodbye_message
      clear
      puts "Thanks for playing Tic Tac Toe, #{human.name}! Goodbye!"
      sleep 2
      clear
    end
  end
end

include TicTacToe

TTTGame.new.play
