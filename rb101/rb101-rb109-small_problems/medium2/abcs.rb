BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  upstring = string.upcase
  BLOCKS.each do |block|
    return false if upstring.count(block) >= 2
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('butch') == false
p block_word?('BBATCH') == false

# ALTERNATIVE SOLUTION:

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end

# FURTHER EXPLORATION:

# def block_word?(string)
#   upstring = string.upcase
#   return false if BLOCKS.any? { |block| upstring.count(block) >= 2 }
#   true
# end
