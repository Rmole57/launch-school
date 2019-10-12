require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT).freeze

  def initialize(program)
    @program = program
  end

  def eval(optional_input = {})
    @register = 0
    @stack = []
    format(@program, optional_input).split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    # The below 'if' statement could also be written as:
    # self.respond_to?(token.downcase, true)
    # ...though this would be a bit imprecise and may
    # cause unexpected behavior
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    # more ambiguous solution:
    # @stack.push(@register)
    new_value = @register
    @stack.push(new_value)
  end

  def add
    # more ambiguous solution:
    # @register += @stack.pop
    new_value = @register
    top_stack_value = @stack.pop
    @register = new_value + top_stack_value
  end

  def sub
    # more ambiguous solution:
    # @register -= @stack.pop
    new_value = @register
    top_stack_value = @stack.pop
    @register = new_value - top_stack_value
  end

  def mult
    # more ambiguous solution:
    # @register *= @stack.pop
    new_value = @register
    top_stack_value = @stack.pop
    @register = new_value * top_stack_value
  end

  def div
    # more ambiguous solution:
    # @register /= @stack.pop
    new_value = @register
    top_stack_value = @stack.pop
    @register = new_value / top_stack_value
  end

  def mod
    # more ambiguous solution:
    # @register %= @stack.pop
    new_value = @register 
    top_stack_value = @stack.pop
    @register = new_value % top_stack_value
  end

  def pop
    # more ambiguous solution:
    # raise EmptyStackError, 'Empty stack!' if @stack.empty?
    # @register = @stack.pop
    top_stack_value = @stack.pop
    raise EmptyStackError, 'Empty stack!' if top_stack_value.nil?
    @register = top_stack_value
  end

  def print
    puts @register
  end
end

CENTIGRADE_TO_FAHRENHEIT = '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
FAHRENHEIT_TO_CENTIGRADE = '9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT'
MPH_TO_KPH = '3 PUSH 5 PUSH %<mph>d MULT DIV PRINT'
RECTANGLE_AREA = '%<length>d PUSH %<width>d MULT PRINT'

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

minilang1 = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang1.eval(degrees_c: 100) # => 212
minilang1.eval(degrees_c: 0) # => 32
minilang1.eval(degrees_c: -40) # => -40

minilang2 = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
minilang2.eval(degrees_f: 212) # => 100
minilang2.eval(degrees_f: 32) # => 0
minilang2.eval(degrees_f: -40) # => -40

minilang3 = Minilang.new(MPH_TO_KPH)
minilang3.eval(mph: 60) # => 100
minilang3.eval(mph: 85) # => 141
minilang3.eval(mph: 3) # => 5

minilang4 = Minilang.new(RECTANGLE_AREA)
minilang4.eval(length: 4, width: 5) # => 20
minilang4.eval(length: 3, width: 7) # => 21
minilang4.eval(length: 2, width: 12) # => 24
