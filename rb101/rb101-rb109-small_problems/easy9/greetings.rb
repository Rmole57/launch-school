def greetings(name_array, status_hash)
  name = name_array.join(' ')
  title = status_hash[:title]
  occupation = status_hash[:occupation]
  puts "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# ALTERNATIVE SOLUTION:

# def greetings(name, status)
#   "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around."
# end

# FURTHER EXPLORATION:

# See original solution above.
