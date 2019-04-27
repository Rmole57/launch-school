print 'What is your age? '
current_age = gets.to_i

print 'At what age would you like to retire? '
retire_age = gets.to_i

current_year = Time.now.year
years_left = retire_age - current_age
retire_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You only have #{years_left} years of work to go!"
