# Original program:

# password = nil

# def set_password
#   puts 'What would you like your password to be?'
#   new_password = gets.chomp
#   password = new_password
# end

# def verify_password
#   puts '** Login **'
#   print 'Password: '
#   input = gets.chomp

#   if input == password
#     puts 'Welcome to the inside!'
#   else
#     puts 'Authentication failed.'
#   end
# end

# if !password
#   set_password
# end

# verify_password

# Fixed code:

# The problem is you're trying to use the variable 'password' in
# the scope of the #verify_password method defintion, where it
# was never defined or passed in.

# You can remedy this by passing in a 'password' argument to
# the #verify_password method. Once you do, be sure to set
# the outer scope password' variable to the #set_password
# return value.

password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

password = set_password unless password

verify_password(password)
