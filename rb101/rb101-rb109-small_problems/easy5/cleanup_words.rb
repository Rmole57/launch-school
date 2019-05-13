def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

# FURTHER EXPLORATION:

# ALPHA_CHARS = 'abcdefghijklmnopqrstuvwxyz'.freeze

# def alpha?(char)
#   ALPHA_CHARS.include?(char.downcase)
# end

# def cleanup(string)
#   clean_string = string.chars.map { |char| alpha?(char) ? char : ' ' }
#   clean_string.join.squeeze(' ')
# end
