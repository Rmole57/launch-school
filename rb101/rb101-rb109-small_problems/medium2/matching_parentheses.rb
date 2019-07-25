def balanced?(string)
  paren_only = string.scan(/\(|\)/)

  return true if paren_only.empty?

  open_paren = paren_only.count('(')
  closed_paren = paren_only.count(')')

  open_paren == closed_paren &&
    paren_only.first == '(' &&
    paren_only.last == ')'
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# ALTERNATIVE SOLUTION:

# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

# FURTHER EXPLORATION:

# def balanced?(string)
#   pairs = 0
#   string.each_char do |char|
#     pairs += 1 if char =~ /\(|\[|\{/
#     pairs -= 1 if char =~ /\)|\]|\}/
#     break if pairs < 0
#   end

#   single_quotes = string.count("'")
#   double_quotes = string.count('"')

#   pairs.zero? && single_quotes.even? && double_quotes.even?
# end

# p balanced?('[][][]][') == false
# p balanced?('(())()') == true
# p balanced?('{}{{{}}}}') == false
# p balanced?(" '' '' '' ") == true
# p balanced?(' "" "" "" ') == true
# p balanced?(" '' '' ' ") == false
# p balanced?(' "" " "" ') == false
