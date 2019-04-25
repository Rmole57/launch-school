require 'yaml'
MESSAGES = YAML.load_file("calculator_messages.yml")
LANGUAGE = 'en'

def translate(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num =~ /\d/ && num =~ /^\d*\.?\d*$/
end

def operation_to_message(op)
  message = case op
            when '1'
              translate('add')
            when '2'
              translate('subtract')
            when '3'
              translate('multiply')
            when '4'
              translate('divide')
            end
  message
end

prompt(translate('welcome'))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(translate('valid_name'))
  else
    break
  end
end

prompt(format(translate('hi'), name: name))

# main loop
loop do
  number1 = ''
  loop do
    prompt(translate('first_num'))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(translate('invalid_num'))
    end
  end

  number2 = ''
  loop do
    prompt(translate('second_num'))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(translate('invalid_num'))
    end
  end

  prompt(translate('operator_prompt'))

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(translate('invalid_op'))
    end
  end

  prompt(
    format(translate('calculating'), operation: operation_to_message(operator))
  )

  result = case operator
           when '1'
             (number1.to_f() + number2.to_f()).round(2)
           when '2'
             (number1.to_f() - number2.to_f()).round(2)
           when '3'
             (number1.to_f() * number2.to_f()).round(2)
           when '4'
             (number1.to_f() / number2.to_f()).round(2)
           end

  prompt(format(translate('result'), result: result))

  prompt(translate('again'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(translate('bye'))
