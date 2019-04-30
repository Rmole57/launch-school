def palindrome?(object)
  object == object.reverse
end

puts palindrome?('madam')
puts palindrome?('Madam')
puts palindrome?("madam i'm adam")
puts palindrome?('356653')

puts palindrome?([1, 1, 1])
puts palindrome?([1, 2, 3])
puts palindrome?([1, 3, 1])
