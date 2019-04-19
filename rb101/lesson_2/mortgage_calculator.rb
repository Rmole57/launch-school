require 'yaml'
MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_loan?(loan)
  loan =~ /\d/ && loan =~ /^\$?\d*\_*\.?\d*$/
end

def valid_percentage?(percentage)
  percentage =~ /\d/ && percentage =~ /^\d*\_*\.?\d*\%?$/
end

def valid_duration?(duration)
  duration =~ /\d/ && duration =~ /^\d*\_*\.?\d*$/
end

prompt(MESSAGES['welcome'])

loop do
  loan = nil
  loop do
    prompt(MESSAGES['loan'])
    loan = gets.chomp

    if valid_loan?(loan)
      loan = loan.delete('$').to_f
      break
    else
      prompt(MESSAGES['invalid_entry'])
    end
  end

  apr = nil
  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp

    if valid_percentage?(apr)
      apr = apr.delete('%').to_f
      break
    else
      prompt(MESSAGES['invalid_entry'])
    end
  end

  monthly_rate = ((apr / 100) / 12)

  years = nil
  loop do
    prompt(MESSAGES['duration'])
    years = gets.chomp

    if valid_duration?(years)
      years = years.to_f
      break
    else
      prompt(MESSAGES['invalid_entry'])
    end
  end

  months = years * 12

  monthly_payment = (loan *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**-months))).round(2)
  monthly_payment = format('%02.2f', monthly_payment)

  prompt(format(MESSAGES['result'], result: monthly_payment))

  prompt(MESSAGES['again'])
  answer = gets.chomp.downcase

  break if !answer.start_with?('y')
end

prompt(MESSAGES['bye'])
