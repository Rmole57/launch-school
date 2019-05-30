def substrings_at_start(string)
  substrings = []
  string.chars.each_index do |idx|
    substrings << string[0..idx]
  end
  substrings
end

def substrings(string)
  all_substrings = []
  string.chars.each_index do |idx|
    all_substrings.concat(substrings_at_start(string[idx..-1]))
  end
  all_substrings
end

def palindrome?(string)
  string.size > 1 && (string == string.reverse)
end

def palindromes(string)
  substrings(string).select do |substring|
    palindrome?(substring)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# ALTERNATIVE SOLUTION:

# def palindromes(string)
#   all_substrings = substrings(string)
#   results = []
#   all_substrings.each do |substring|
#     results << substring if palindrome?(substring)
#   end
#   results
# end

# def palindrome?(string)
#   string == string.reverse && string.size > 1
# end

# FURTHER EXPLORATION:

# def substrings_at_start(string)
#   substrings = []
#   string.chars.each_index do |idx|
#     substrings << string[0..idx]
#   end
#   substrings
# end

# def substrings(string)
#   all_substrings = []
#   alpha_only = string.chars.delete_if { |char| char =~ /[^a-z0-9]/i }.join
#   alpha_only.chars.each_index do |idx|
#     all_substrings.concat(substrings_at_start(alpha_only[idx..-1]))
#   end
#   all_substrings
# end

# def palindrome?(string)
#   string.size > 1 && (string == string.reverse)
# end

# def palindromes(string)
#   substrings(string).select do |substring|
#     palindrome?(substring.downcase)
#   end
# end

# p palindromes('hel!lo-Mad_am-1did1-ma22dam-go_od-$bye-') # => ["ll", "Madam", "ada", "am1did1ma", "m1did1m", "1did1", "did", "22", "oo"]
