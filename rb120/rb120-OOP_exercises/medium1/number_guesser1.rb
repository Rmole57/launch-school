class GuessingGame
  VALID_RANGE = 1..100
  NUMBER_OF_GUESSES = 7

  def play
    restart_game
    until no_guesses?
      display_guesses
      pick_a_number
      break if winning_number?
      display_high_or_low
      lose_a_guess
    end
    display_result
  end

  private

  def restart_game
    @guesses = NUMBER_OF_GUESSES
    @winning_number = rand(VALID_RANGE)
  end

  def display_guesses
    puts "You have #{@guesses} guesses remaining."
  end

  def valid_integer_string?
    @choice.to_i.to_s == @choice
  end

  def in_range?
    VALID_RANGE.cover?(@choice.to_i)
  end

  def pick_a_number
    @choice = nil
    loop do
      print "Enter a number between #{VALID_RANGE.begin} " \
           " and #{VALID_RANGE.end}: "
      @choice = gets.chomp
      if valid_integer_string? && in_range?
        @choice = @choice.to_i
        break
      end
      print 'Invalid guess. '
    end
  end

  def winning_number?
    @choice == @winning_number
  end

  def display_high_or_low
    if @choice > @winning_number
      puts 'Your guess is too high.'
    else
      puts 'Your guess is too low.'
    end
    puts
  end

  def lose_a_guess
    @guesses -= 1
  end

  def no_guesses?
    @guesses <= 0
  end

  def display_result
    if winning_number?
      puts "That's the number!"
      puts
      puts 'You won!'
    else
      puts
      puts 'You have no more guesses. You lost!'
    end
    puts
  end
end

game = GuessingGame.new
game.play
game.play

# ALTERNATIVE SOLUTION:

# class GuessingGame
#   MAX_GUESSES = 7
#   RANGE = 1..100

#   RESULT_OF_GUESS_MESSAGE = {
#     high:  "Your number is too high.",
#     low:   "Your number is too low.",
#     match: "That's the number!"
#   }.freeze

#   WIN_OR_LOSE = {
#     high:  :lose,
#     low:   :lose,
#     match: :win
#   }.freeze

#   RESULT_OF_GAME_MESSAGE = {
#     win:  "You won!",
#     lose: "You have no more guesses. You lost!"
#   }.freeze

#   def initialize
#     @secret_number = nil
#   end

#   def play
#     reset
#     game_result = play_game
#     display_game_end_message(game_result)
#   end

#   private

#   def reset
#     @secret_number = rand(RANGE)
#   end

#   def play_game
#     result = nil
#     MAX_GUESSES.downto(1) do |remaining_guesses|
#       display_guesses_remaining(remaining_guesses)
#       result = check_guess(obtain_one_guess)
#       puts RESULT_OF_GUESS_MESSAGE[result]
#       break if result == :match
#     end
#     WIN_OR_LOSE[result]
#   end

#   def display_guesses_remaining(remaining)
#     puts
#     if remaining == 1
#       puts 'You have 1 guess remaining.'
#     else
#       puts "You have #{remaining} guesses remaining."
#     end
#   end

#   def obtain_one_guess
#     loop do
#       print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
#       guess = gets.chomp.to_i
#       return guess if RANGE.cover?(guess)
#       print "Invalid guess. "
#     end
#   end

#   def check_guess(guess_value)
#     return :match if guess_value == @secret_number
#     return :low if guess_value < @secret_number
#     :high
#   end

#   def display_game_end_message(result)
#     puts "", RESULT_OF_GAME_MESSAGE[result]
#   end
# end

# FURTHER EXPLORATION:

# Though adding more classes might seem like it "complicates"
# the code, it also organizes it a little better. Because of
# encapsulation, you have a clear understanding of the moving
# parts of the game and how they all interact and collaborate
# with one another.

# module GuessThatNumber
#   module GameSettings
#     RANGE = 1..100

#     def valid_number?(guess)
#       RANGE.cover?(guess)
#     end
#   end

#   class Player
#     include GameSettings

#     MAX_GUESSES = 7

#     attr_reader :guesses, :choice

#     def initialize
#       @guesses = MAX_GUESSES
#       @choice = nil
#     end

#     def guess_number
#       guess = nil
#       loop do
#         print "Enter a number between #{RANGE.first} " \
#               "and #{RANGE.last}: "
#         guess = gets.chomp.to_i
#         break if valid_number?(guess)
#         print "Invalid guess. "
#       end
#       @choice = guess
#     end 
#   end

#   class GuessingGame
#     include GameSettings

#     RESULT_OF_GUESS_MESSAGE = {
#       high:  "Your number is too high.",
#       low:   "Your number is too low.",
#       match: "That's the number!"
#     }.freeze

#     WIN_OR_LOSE = {
#       high:  :lose,
#       low:   :lose,
#       match: :win
#     }.freeze

#     RESULT_OF_GAME_MESSAGE = {
#       win:  "You won!",
#       lose: "You have no more guesses. You lost!"
#     }.freeze

#     def initialize
#       @secret_number = nil
#       @player = Player.new
#     end

#     def play
#       reset
#       game_result = play_game
#       display_game_end_message(game_result)
#     end

#     private

#     attr_reader :player

#     def reset
#       @secret_number = rand(RANGE)
#     end

#     def play_game
#       result = nil
#       player.guesses.downto(1) do |remaining_guesses|
#         display_guesses_remaining(remaining_guesses)
#         player.guess_number
#         result = check_guess(player.choice)
#         puts RESULT_OF_GUESS_MESSAGE[result]
#         break if result == :match
#       end
#       WIN_OR_LOSE[result]
#     end

#     def display_guesses_remaining(remaining)
#       puts
#       if remaining == 1
#         puts 'You have 1 guess remaining.'
#       else
#         puts "You have #{remaining} guesses remaining."
#       end
#     end

#     def check_guess(guess_value)
#       return :match if guess_value == @secret_number
#       return :low if guess_value < @secret_number
#       :high
#     end

#     def display_game_end_message(result)
#       puts "", RESULT_OF_GAME_MESSAGE[result]
#     end
#   end
# end

# game = GuessThatNumber::GuessingGame.new
# game.play
# game.play
