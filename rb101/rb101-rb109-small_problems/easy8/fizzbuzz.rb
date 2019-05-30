def fizzbuzz_value(num)
  case
  when (num % 3).zero? && (num % 5).zero? then 'FizzBuzz'
  when (num % 3).zero? then 'Fizz'
  when (num % 5).zero? then 'Buzz'
  else num
  end
end

def fizzbuzz(num1, num2)
  arr = []
  (num1..num2).each do |num|
    arr << fizzbuzz_value(num)
  end
  puts arr.join(', ')
end

fizzbuzz(1, 15)

# ALTERNATIVE SOLUTION:

# def fizzbuzz(starting_number, ending_number)
#   result = []
#   starting_number.upto(ending_number) do |number|
#     result << fizzbuzz_value(number)
#   end
#   puts result.join(', ')
# end

# def fizzbuzz_value(number)
#   case
#   when number % 3 == 0 && number % 5 == 0
#     'FizzBuzz'
#   when number % 5 == 0
#     'Buzz'
#   when number % 3 == 0
#     'Fizz'
#   else
#     number
#   end
# end
