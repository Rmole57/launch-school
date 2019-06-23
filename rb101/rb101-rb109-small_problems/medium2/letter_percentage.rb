def letter_percentages(string)
  percentages = {}
  length = string.size.to_f

  percentages[:lowercase] = (string.count('a-z') / length) * 100
  percentages[:uppercase] = (string.count('A-Z') / length) * 100
  percentages[:neither]   = (string.count('^a-zA-Z') / length) * 100

  percentages.each { |key, value| percentages[key] = value.round(2) }

  percentages
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')
p letter_percentages('abcdefGHI')

# ALTERNATIVE SOLUTIONS:

# 1)
# def letter_percentages(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }
#   percentages = { lowercase: [], uppercase: [], neither: [] }
#   characters = string.chars
#   length = string.length

#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

#   calculate(percentages, counts, length)

#   percentages
# end

# def calculate(percentages, counts, length)
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f) * 100
# end

# 2)
# def letter_percentages(string)
#   percentages = {}
#   length = string.size.to_f
#   percentages[:lowercase] = (string.count('a-z') / length) * 100
#   percentages[:uppercase] = (string.count('A-Z') / length) * 100
#   percentages[:neither]   = 100 - (percentages[:lowercase] + percentages[:uppercase])
#   percentages
# end

# FURTHER EXPLORATION:

# (See solution above!)
