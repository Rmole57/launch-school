def letter_case_count(string)
  case_count = {}

  case_count[:lowercase] = string.count('a-z')
  case_count[:uppercase] = string.count('A-Z')
  case_count[:neither] = string.count('^a-zA-Z')

  case_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# ALTERNATIVE SOLUTIONS:

# 1)
# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

# 2)
# def letter_case_count(string)
#   case_count = { lowercase: 0, uppercase: 0, neither: 0 }

#   string.each_char do |char|
#     case_count[:lowercase] += 1 if char =~ /[a-z]/
#     case_count[:uppercase] += 1 if char =~ /[A-Z]/
#     case_count[:neither] += 1 if char =~ /[^a-zA-Z]/
#   end

#   case_count
# end

# 3)
# def letter_case_count(string)
#   {
#     lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither:   string.count('^a-zA-Z')
#   }
# end
