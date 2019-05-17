def multiply(numbers, multiplier)
  multiplied_nums = []
  count = 0

  loop do
    break if count == numbers.size

    multiplied_nums << numbers[count] * multiplier
    count += 1
  end

  multiplied_nums
end

my_numbers = [1, 4, 3, 7, 2, 6]

p multiply(my_numbers, 3)
