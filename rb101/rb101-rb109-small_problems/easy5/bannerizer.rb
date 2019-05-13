def print_box_edge(length)
  puts "+#{'-' * (length + 2)}+"
end

def print_empty_line(length)
  puts "|#{' ' * (length + 2)}|"
end

def print_message(text)
  puts "| #{text} |"
end

def print_in_box(message)
  print_box_edge(message.length)
  print_empty_line(message.length)
  print_message(message)
  print_empty_line(message.length)
  print_box_edge(message.length)
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# ALTERNATIVE SOLUTION:

# def print_in_box(message)
#    horizontal_rule = "+#{'-' * (message.size + 2)}+"
#    empty_line = "|#{' ' * (message.size + 2)}|"

#    puts horizontal_rule
#    puts empty_line
#    puts "| #{message} |"
#    puts empty_line
#    puts horizontal_rule
# end

# FURTHER EXPLORATION:

# Truncating:

# MAX_TEXT_WIDTH = 76

# def print_in_box(message)
#   message.slice!(75..-1) if message.size > MAX_TEXT_WIDTH
#   horizontal_rule = "+#{'-' * (message.size + 2)}+"
#   empty_line = "|#{' ' * (message.size + 2)}|"

#   puts horizontal_rule
#   puts empty_line
#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end

# Wrapping text:

# MAX_TEXT_WIDTH = 76

# def print_box_edge(length)
#   puts "+#{'-' * (length + 2)}+"
# end

# def print_empty_line(length)
#   puts "|#{' ' * (length + 2)}|"
# end

# def print_message(lines, text_length)
#   lines.each do |line|
#     puts "| #{line + (' ' * (text_length - line.size))} |"
#   end
# end

# def get_text_lines(text)
#   text.scan(/\b.{1,#{MAX_TEXT_WIDTH}}\b\W*/)
# end

# def get_text_length(text_array)
#   if text_array.empty?
#     0
#   else
#     text_array.max_by(&:size).size
#   end
# end

# def print_in_box(message)
#   text_lines = get_text_lines(message)
#   text_length = get_text_length(text_lines)

#   print_box_edge(text_length)
#   print_empty_line(text_length)
#   print_message(text_lines, text_length)
#   print_empty_line(text_length)
#   print_box_edge(text_length)
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')
# print_in_box('catdog')
# print_in_box('Lorem ipsum dolor sit amet, consectetur adipiscing elit, ' \
#              'sed do eiusmod tempor incididunt ut labore et dolore magna ' \
#              'aliqua. Ut enim ad minim veniam, quis nostrud exercitation ' \
#              'ullamco laboris nisi ut aliquip ex ea commodo consequat.')
