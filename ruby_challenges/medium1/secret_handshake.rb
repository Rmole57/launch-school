class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(dec_num)
    @bin_num = valid_input?(dec_num) ? convert_input(dec_num) : 0
  end

  def commands
    digits = @bin_num.digits
    command_list = []

    digits.each_with_index do |digit, idx|
      next unless digit == 1

      COMMANDS[idx] ? command_list << COMMANDS[idx] : command_list.reverse!
    end

    command_list
  end

  private

  def valid_input?(num)
    num.to_s =~ /\A[01]+\z/ || num.is_a?(Integer)
  end

  def convert_input(input)
    input.is_a?(String) ? input.to_i : input.to_s(2).to_i
  end
end

# ALTERNATIVE SOLUTIONS:

# 1 - Original Solution
# class SecretHandshake
#   def initialize(dec_num)
#     @bin_num = valid_input?(dec_num) ? convert_input(dec_num) : 0
#   end

#   def commands
#     digits = @bin_num.digits
#     command_list = []

#     digits.each_with_index do |digit, idx|
#       if digit == 1
#         case idx
#         when 0 then command_list << 'wink'
#         when 1 then command_list << 'double blink'
#         when 2 then command_list << 'close your eyes'
#         when 3 then command_list << 'jump'
#         else        command_list.reverse!
#         end
#       end
#     end

#     command_list
#   end

#   private

#   def valid_input?(num)
#     num.to_s =~ /[01]+/ || num.is_a?(Integer)
#   end

#   def convert_input(input)
#     if input.is_a?(String)
#       input.to_i
#     else
#       input.to_s(2).to_i
#     end
#   end
# end

# 2 - An interesting solution from a classmate
# class SecretHandshake
#   CMDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

#   def initialize(num)
#     @digits = num.is_a?(String) ? num.to_i.digits : num.digits(2)
#   end

#   def commands
#     cmds = @digits.map.with_index { |dig, idx| CMDS[idx] if dig == 1 }.compact
#     @digits[4] == 1 ? cmds.reverse : cmds
#   end
# end
