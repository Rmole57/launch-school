def double_numbers!(numbers)
  count = 0

  loop do
    break if count == numbers.size
    numbers[count] *= 2
    count += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

p my_numbers
p double_numbers!(my_numbers)
p my_numbers

# ALTERNATIVE SOLUTION:

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     numbers[counter] = current_number * 2

#     counter += 1
#   end

#   numbers
# end
