VALID_CHOICES = %w[rock paper scissors lizard spock]
WINNING_COMBOS = {
  rock:     ['scissors', 'lizard'],
  paper:    ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard:   ['spock', 'paper'],
  spock:    ['scissors', 'rock']
}
POINTS = 5

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

def win?(first, second)
  WINNING_COMBOS[first.to_sym].include?(second)
end

def display_results(player, computer)
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

system('clear')
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("First to #{POINTS} wins!")
sleep(3)

# main loop
loop do
  player_wins = 0
  computer_wins = 0
  until player_wins == POINTS || computer_wins == POINTS
    system('clear')
    display_score(player_wins, computer_wins)

    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

      if choice == 's'
        prompt("Did you mean 'scissors' or 'spock'?")
        choice = Kernel.gets().chomp()
      end

      convert_choice!(choice)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end

    display_score(player_wins, computer_wins)

    if player_wins == POINTS
      prompt("Congratulations! You're the grand winner!")
    elsif computer_wins == POINTS
      prompt("Sorry! The computer is the Grand Winner!")
    else
      prompt("Next round starting soon...")
    end

    sleep(3)
  end

  prompt("Do you want to play again? ('Y' to play again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
