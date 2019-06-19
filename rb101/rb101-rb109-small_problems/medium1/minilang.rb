ACTIONS = %w(PUSH POP PRINT).freeze
OPERATIONS = %w(ADD SUB MULT DIV MOD).freeze
PROGRAM_KEYWORDS = ACTIONS + OPERATIONS

def integer_conversion(input_array)
  input_array.map do |item|
    item == item.to_i.to_s ? item.to_i : item
  end
end

def no_print?(input_array)
  puts '(nothing printed; no PRINT commands)' unless input_array.include?('PRINT')
end

def valid_input?(input)
  PROGRAM_KEYWORDS.include?(input) || input.class == Integer
end

def validate_input(input_array)
  input_array.each do |input|
    raise "Invalid program input: #{input.inspect}" unless valid_input?(input)
  end
end

def validate_stack(stack, operation)
  if stack.empty? && OPERATIONS.include?(operation)
    raise "Can't perform #{operation} because stack is empty!"
  end
end

def minilang(input_string)
  register = 0
  input_array = input_string.split
  stack = []
  input_array = integer_conversion(input_array)
  validate_input(input_array)
  input_array.each do |item|
    validate_stack(stack, item)
    case item
    when 'PUSH'  then stack.push(register)
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else
      register = item
    end
  end
  no_print?(input_array)
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')

# FURTHER EXPLORATION:

# Program for (3 + (4 * 5) - 7) / (5 % 3):
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

# Test for invalid input:
minilang('3 PUSH HEY')

# Test for empty stack:
minilang('3 PUSH 4 ADD MULT PRINT')
