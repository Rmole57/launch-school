def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

puts palindromic_number?(34543)
puts palindromic_number?(123210)
puts palindromic_number?(22)
puts palindromic_number?(5)

# FURTHER EXPLORATION:

# If the input begins with one or more 0s the method will not work
# because decimal numbers written with leading zeros are interpreted
# as octal by languages that follow this convention (Ruby) and will generate
# unexpected results, as well as errors if they contain '8' or '9' since
# those digits do not exist in octal.

# Input beginning with one or more zeros is an example of Ruby's
# Octal Literal syntax.

# This method could still "work" if you're talking about whether the
# "decimal equivalent" of an octal input is a palindrome. For example:
# paindromic_number?(054) == true because 054 == 44.

# However, if we're discussing preserving octal digits, well it gets a bit
# trickier. In Ruby we can preserve the significant digits in an octal
# representation by supplying #to_s with a base argument ==> to_s(8). But
# you'll still have to validate the input to determine whether it is in
# base 8 or not. And even then, only significant digits are preserved, so
# leading zeros are left out.

# So, assuming you're even able to validate the input, after converting
# the input using to_s(8), palindromic_number?(0540) == false because
# 0540.to_s(8) == '540'.

# At this time, in my opinion, I do not believe a palindromic check
# can be done on octal numbers while preserving all octal digits including
# leading and trailing zeros.
