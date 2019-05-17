def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

words = "the flintstones rock"

p titleize(words)

# ALTERNATIVE SOLUTION:

# def titleize(string)
#   title = []
#   string.split.each do |word|
#     title << word.capitalize
#   end
#   title.join(' ')
# end
