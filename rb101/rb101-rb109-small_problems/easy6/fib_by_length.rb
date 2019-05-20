def find_fibonacci_index_by_length(length)
  fibonacci_array = [1, 1]
  fib1, fib2 = fibonacci_array

  until fib2.to_s.size >= length
    fib2 += fib1
    fibonacci_array << fib2
    fib1 = fib2 - fib1
  end

  fibonacci_array.size
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# ALTERNATIVE SOLUTION:

# def find_fibonacci_index_by_length(number_digits)
#   first = 1
#   second = 1
#   index = 2

#   loop do
#     index += 1
#     fibonacci = first + second
#     break if fibonacci.to_s.size >= number_digits

#     first = second
#     second = fibonacci
#   end

#   index
# end
