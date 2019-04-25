# Constants to be used throughout program.
VALID_CHOICES = %w[rock paper scissors lizard spock]
WINNING_COMBOS = {
  rock:     ['scissors', 'lizard'],
  paper:    ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard:   ['spock', 'paper'],
  spock:    ['scissors', 'rock']
}
POINTS = 5

# Methods to be used throughout program.
def prompt(message)
  Kernel.puts("=> #{message}")
end

def convert_choice!(choice)
  VALID_CHOICES.each do |option|
    if option.start_with?(choice.downcase) && !choice.empty?
      return choice.replace(option)
    end
  end
end

def scissors_or_spock
  prompt("Did you mean 'scissors' or 'spock'?")
  gets.chomp
end

def retrieve_player_choice
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice = gets.chomp

  if choice.downcase == 's'
    choice = scissors_or_spock
  end

  convert_choice!(choice)
end

def valid_choice?(choice)
  if VALID_CHOICES.include?(choice)
    true
  else
    prompt("That's not a valid choice.")
  end
end

def win?(first, second)
  WINNING_COMBOS[first.to_sym].include?(second)
end

def display_results(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")

  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player_score, computer_score)
  prompt("Score: You - #{player_score}, Computer - #{computer_score}")
end

def grand_winner?(score1, score2)
  score1 == POINTS || score2 == POINTS
end

def display_grand_winner(player_points, computer_points)
  if player_points == POINTS
    prompt("Congratulations! You're the Grand Winner!")
  elsif computer_points == POINTS
    prompt("Sorry! The Computer is the Grand Winner!")
  end
end

# Welcome's user.
system('clear')
prompt("Welcome to #{VALID_CHOICES.join(', ')}!")
prompt("First to #{POINTS} points wins!")
sleep(3)

# Main game loop
loop do
  # Sets player scores.
  player_score = 0
  computer_score = 0

  # Game rounds loop.
  until player_score == POINTS || computer_score == POINTS
    system('clear')
    # Displays current score.
    display_score(player_score, computer_score)

    # Sets and validates user's choice.
    user_choice = ''
    loop do
      user_choice = retrieve_player_choice
      break if valid_choice?(user_choice)
    end

    # Sets computer's choice.
    computer_choice = VALID_CHOICES.sample

    # Evaluates and displays results of current round.
    display_results(user_choice, computer_choice)

    # Increments scores as necessary.
    if win?(user_choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, user_choice)
      computer_score += 1
    end

    # Displays updated score and end of round message.
    display_score(player_score, computer_score)

    # Displays grand winner if there is one, else proceeds to next round.
    if grand_winner?(player_score, computer_score)
      display_grand_winner(player_score, computer_score)
    else
      prompt("Next round starting soon...")
      sleep(3)
    end
  end

  # Asks if user would like to play again.
  prompt("Do you want to play again? ('Y' to play again)")
  answer = gets.chomp
  break unless answer == 'y'
end

# Good bye message.
prompt("Thank you for playing! Good bye!")
