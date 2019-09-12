class String
  def to_move
    case self
    when 'Rock'     then Rock.new
    when 'Paper'    then Paper.new
    when 'Scissors' then Scissors.new
    when 'Lizard'   then Lizard.new
    when 'Spock'    then Spock.new
    end
  end

  def to_bot
    case self
    when 'R2D2'     then R2D2.new
    when 'Hal'      then Hal.new
    when 'Chappie'  then Chappie.new
    when 'Sonny'    then Sonny.new
    when 'Number 5' then Number5.new
    end
  end
end

class Move
  VALUES = %w(Rock Paper Scissors Lizard Spock).freeze

  def to_s
    self.class.to_s
  end
end

class Rock < Move
  def win?(other_move)
    other_move.class == Scissors || other_move.class == Lizard
  end
end

class Paper < Move
  def win?(other_move)
    other_move.class == Rock || other_move.class == Spock
  end
end

class Scissors < Move
  def win?(other_move)
    other_move.class == Paper || other_move.class == Lizard
  end
end

class Lizard < Move
  def win?(other_move)
    other_move.class == Paper || other_move.class == Spock
  end
end

class Spock < Move
  def win?(other_move)
    other_move.class == Scissors || other_move.class == Rock
  end
end

class Player
  attr_accessor :move, :name, :history, :score

  def initialize
    set_name
    @history = History.new(name)
  end

  def reset_score
    self.score = 0
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts 'Please choose Rock, Paper, Scissors, ' \
           'Lizard, or Spock:'
      puts "*NOTE: Case insensitive/abbreviated forms " \
           "are allowed (i.e., 'ro' = 'Rock')"
      choice = gets.chomp.capitalize
      if valid_move?(choice) && !choice.empty?
        choice = format_choice(choice)
        break
      end
      puts 'Sorry, invalid choice.'
    end
    self.move = choice.to_move
  end

  private

  def set_name
    system 'clear'
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break if n =~ /^\w/
      puts 'Sorry, that name is invalid.'
    end
    self.name = n
  end

  def valid_move?(move)
    Move::VALUES.any? { |val| val.start_with?(move) }
  end

  def scissors_or_spock?
    answer = nil
    loop do
      puts 'Did you mean Scissors or Spock?'
      answer = gets.chomp.capitalize
      break if valid_move?(answer) && answer =~ /^S\w/
      puts 'Sorry, invalid choice.'
    end
    answer
  end

  def format_choice(string)
    Move::VALUES.each do |val|
      string = scissors_or_spock? if string == 'S'
      return val if val.start_with?(string)
    end
  end
end

module Tendency
  def best_odds
    best_moves = history.win_percentages.select do |move, percentage|
      percentage > 50.0 || history.record[move].empty?
    end.keys

    if best_moves.empty?
      Move::VALUES.sample.to_move
    else
      best_moves.sample.to_move
    end
  end

  def rock_only
    'Rock'.to_move
  end

  def no_paper_scissor_heavy
    %w(Scissors Scissors Scissors Scissors
       Rock Lizard Spock).sample.to_move
  end

  def forgot_a_move
    (Move::VALUES - [Move::VALUES.sample]).sample.to_move
  end

  def move_number_5
    Move::VALUES.shuffle[4].to_move
  end
end

class Computer < Player
  BOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].freeze

  include Tendency

  def to_s
    self.class.to_s
  end

  private

  def set_name
    self.name = to_s
  end
end

class R2D2 < Computer
  def choose
    self.move = rock_only
  end
end

class Hal < Computer
  def choose
    self.move = no_paper_scissor_heavy
  end
end

class Chappie < Computer
  def choose
    self.move = forgot_a_move
  end
end

class Sonny < Computer
  def choose
    self.move = best_odds
  end
end

class Number5 < Computer
  def choose
    self.move = move_number_5
  end

  def to_s
    'Number 5'
  end
end

class History
  attr_reader :name, :record, :win_percentages

  def initialize(name)
    @name = name
    @record = set_record
    @win_percentages = set_percentages
  end

  def to_s
    format_history
  end

  private

  def set_record
    win_hsh = {}
    Move::VALUES.each { |val| win_hsh[val] = [] }
    win_hsh
  end

  def set_percentages
    win_hsh = {}
    Move::VALUES.each { |val| win_hsh[val] = 0.0 }
    win_hsh
  end

  def format_history
    history_str = "#{name}'s game history:\n"
    record.each do |move, results|
      history_str << "#{move} - #{results.join(', ')} " \
                    "=> #{win_percentages[move]}% MWP\n"
    end
    history_str
  end
end

# Game Orchestration Engine
class RPSgame
  RULES = ['Scissors cuts Paper', 'Paper covers Rock',
           'Rock crushes Lizard', 'Lizard poisons Spock',
           'Spock smashes Scissors', 'Scissors decapitates Lizard',
           'Lizard eats Paper', 'Paper disproves Spock',
           'Spock vaporizes Rock', 'Rock crushes Scissors'].freeze
  SCORE_LIMIT = 7

  def initialize
    @human = Human.new
    @computer = Computer::BOTS.sample.to_bot
  end

  def play
    start_of_game
    loop do
      reset_game_score
      until score_limit_reached?
        display_score
        human.choose
        computer.choose
        end_of_round
      end
      display_grand_winner
      break unless play_again?
    end
    end_of_game
  end

  private

  attr_reader :human, :computer

  def display_welcome_message
    puts "Hi, #{human.name}! Welcome to Rock, Paper, " \
         "Scissors, Lizard, Spock!"
    sleep 2
  end

  def display_rules
    puts 'Game Rules:'
    puts RULES
    puts
    puts "First to #{SCORE_LIMIT} wins!"
    puts
    loop do
      puts 'Press Enter to continue...'
      answer = gets.chomp
      break if answer.empty?
      puts "Sorry, that's invalid."
    end
  end

  def start_of_game
    system 'clear'
    display_welcome_message
    system 'clear'
    display_rules
    system 'clear'
  end

  def reset_game_score
    human.reset_score
    computer.reset_score
  end

  def score_limit_reached?
    human.score >= SCORE_LIMIT || computer.score >= SCORE_LIMIT
  end

  def display_score
    system 'clear'
    puts "Current Score - #{human.name}: #{human.score}, " \
         "#{computer.name}: #{computer.score}"
  end

  def record_win(winner, loser)
    winner.history.record[winner.move.to_s] << 'W'
    loser.history.record[loser.move.to_s] << 'L'
  end

  def record_tie(*players)
    players.each do |player|
      player.history.record[player.move.to_s] << 'T'
    end
  end

  def human_win
    human.score += 1
    record_win(human, computer)
  end

  def computer_win
    computer.score += 1
    record_win(computer, human)
  end

  def record_results
    if human.move.win?(computer.move)
      human_win
    elsif computer.move.win?(human.move)
      computer_win
    else
      record_tie(human, computer)
    end
  end

  def update_percentages(*players)
    players.each do |player|
      player.history.record.each do |move, results|
        unless results.empty?
          percentage = results.count('W').fdiv(results.size) * 100
          player.history.win_percentages[move] = percentage.round(1)
        end
      end
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move.win?(computer.move)
      puts "#{human.name} won!"
    elsif computer.move.win?(human.move)
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_round_results
    display_moves
    display_winner
    sleep 2
  end

  def end_of_round
    record_results
    update_percentages(human, computer)
    display_round_results
  end

  def grand_winner
    if human.score > computer.score
      human.name
    else
      computer.name
    end
  end

  def display_grand_winner
    display_score
    puts "#{grand_winner} is the Grand Winner!"
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if answer.start_with?('y', 'n')
      puts "Sorry, must start with 'y' or 'n'."
    end
    answer.start_with?('y')
  end

  def display_goodbye_message
    system 'clear'
    puts 'Thanks for playing Rock, Paper, Scissors, ' \
          'Lizard, Spock. Good bye!'
    sleep 2
  end

  def display_game_stats
    system 'clear'
    puts "Game Stats:\n(MWP = Move Win Percentage)"
    puts
    puts human.history
    puts
    puts computer.history
  end

  def end_of_game
    display_goodbye_message
    display_game_stats
  end
end

RPSgame.new.play
