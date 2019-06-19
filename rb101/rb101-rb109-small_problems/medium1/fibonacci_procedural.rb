def fibonacci(nth)
  return nth if nth < 2
  acc1, acc2 = [0, 1]
  (2..nth).each do
    result = acc1 + acc2
    acc1 = acc2
    acc2 = result
  end
  acc2
end

p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001)

# ALTERNATIVE SOLUTION:

# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end

#   last
# end
