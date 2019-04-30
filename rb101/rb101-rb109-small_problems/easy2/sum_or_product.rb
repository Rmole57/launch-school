def retrieve_number
  puts '>> Please enter an integer greater than 0:'
  gets.to_i
end

def valid_number?(number)
  number > 0 && number.is_a?(Integer)
end

def display_invalid_input
  puts 'Oops! Invalid input!'
end

def retrieve_operation
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  gets.chomp.downcase
end

def compute_sum(number)
  (1..number).inject(:+)
end

def compute_product(number)
  (1..number).inject(:*)
end

def display_sum(number, sum)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
end

def display_product(number, product)
  puts "The product of the integers between 1 and #{number} is #{product}."
end

number = nil
loop do
  number = retrieve_number

  break if valid_number?(number)
  display_invalid_input
end

loop do
  operation = retrieve_operation

  case operation
  when 's'
    sum = compute_sum(number)
    display_sum(number, sum)
    break
  when 'p'
    product = compute_product(number)
    display_product(number, product)
    break
  else
    display_invalid_input
  end
end

# ALTERNATIVE SOLUTION:

# def compute_sum(number)
#   total = 0
#   1.upto(number) { |value| total += value }
#   total
# end

# def compute_product(number)
#   total = 1
#   1.upto(number) { |value| total *= value }
#   total
# end
