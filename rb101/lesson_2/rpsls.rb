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
  prompt("Did you mean scissors ('sc') or spock ('sp')?")
  gets.chomp
end

def retrieve_player_choice
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("NOTE: first letters are acceptable (example: 'r' == 'rock')")
  choice = gets.chomp

  while choice.downcase == 's'
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

def display_choices(player_choice, computer_choice)
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
end

def win_round?(first, second)
  WINNING_COMBOS[first.to_sym].include?(second)
end

def display_score(player_score, computer_score)
  prompt("Score: You - #{player_score}, Computer - #{computer_score}")
end

def grand_winner?(score)
  score == POINTS
end

def display_grand_winner(player, computer)
  if grand_winner?(player)
    prompt("Congratulations! You're the Grand Winner!")
  elsif grand_winner?(computer)
    prompt("Sorry! The Computer is the Grand Winner!")
  end
end

# Game starts here.
system('clear')
prompt("Welcome to #{VALID_CHOICES.join(', ')}!")
prompt("First to #{POINTS} points wins!")
sleep(3)

loop do
  player = { choice: '', score: 0 }
  computer = { choice: '', score: 0 }
  loop do
    system('clear')

    display_score(player[:score], computer[:score])

    loop do
      player[:choice] = retrieve_player_choice
      break if valid_choice?(player[:choice])
    end

    computer[:choice] = VALID_CHOICES.sample

    display_choices(player[:choice], computer[:choice])

    if win_round?(player[:choice], computer[:choice])
      prompt("You won the round!")
      player[:score] += 1
    elsif win_round?(computer[:choice], player[:choice])
      prompt("Computer won the round!")
      computer[:score] += 1
    else
      prompt("It's a tie!")
    end

    display_score(player[:score], computer[:score])

    break if grand_winner?(player[:score]) || grand_winner?(computer[:score])
    prompt("Next round starting soon...")
    sleep(3)
  end

  display_grand_winner(player[:score], computer[:score])
  prompt("Do you want to play again? ('Y' to play again)")
  answer = gets.chomp
  break unless answer == 'y'
end

prompt("Thank you for playing! Good bye!")
