class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @message.length}-+"
  end

  def empty_line
    "| #{' ' * @message.length} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

# ALTERNATIVE SOLUTION:

# class Banner
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def empty_line
#     "| #{' ' * (@message.size)} |"
#   end

#   def horizontal_rule
#     "+-#{'-' * (@message.size)}-+"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# FURTHER EXPLORATION:

# class Banner
#   def initialize(message, width = (message.size + 2))
#     @message = message
#     @width = width if validate_width(width)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def validate_width(width)
#     if width < (@message.size + 2)
#       raise 'Sorry, your desired width is too small for this banner!'
#     elsif width > 80
#       raise 'Sorry, the largest acceptable banner width is 80 characters!'
#     end
#     true
#   end

#   def horizontal_rule
#     "+#{'-' * @width}+"
#   end

#   def empty_line
#     "|#{' ' * @width}|"
#   end

#   def message_line
#     l_padding = (@width - @message.size) / 2
#     r_padding = @width.even? ? l_padding : l_padding + 1

#     "|#{' ' * l_padding}#{@message}#{' ' * r_padding}|"
#   end
# end

# # Test cases:
# # These should print out successfully.
# banner = Banner.new('To boldly go where no one has gone before.', 80)
# puts banner

# banner = Banner.new('', 53)
# puts banner

# # These should raise error messages.
# banner = Banner.new('To boldly go where no one has gone before. To boldly go where no one has gone before...again.')
# puts banner

# banner = Banner.new('', 88)
# puts banner

# banner = Banner.new('To boldly go where no one has gone before.', 30)
# puts banner
