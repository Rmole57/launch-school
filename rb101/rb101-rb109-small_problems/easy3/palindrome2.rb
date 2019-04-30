def convert_to_alphanumeric(string)
  string.downcase.delete('^a-z0-9')
end

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = convert_to_alphanumeric(string)
  palindrome?(string)
end

puts real_palindrome?('madam')
puts real_palindrome?('Madam')
puts real_palindrome?("Madam, I'm Adam")
puts real_palindrome?('356653')
puts real_palindrome?('356a653')
puts real_palindrome?('123ab321')
