def display_age(name = 'Teddy')
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

name = ''
loop do
  puts 'Please enter a name:'
  name = gets.chomp

  break unless name.empty?
  puts 'You forgot to enter a name!'
end

display_age(name)
