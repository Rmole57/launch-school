def average(arr)
  arr.sum / arr.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


=begin

ALTERNATIVE SOLUTIONS:

1)
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

2)
def average(numbers)
  sum = numbers.reduce(:+)
  sum / numbers.count
end


FURTHER EXPLORATION:

Currently, the return value of average is an Integer. When dividing numbers, sometimes the quotient 
isn't a whole number, therefore, it might make more sense to return a Float. Can you change the return 
value of average from an Integer to a Float?

ANSWER:

def average(arr)
  arr.sum.to_f / arr.size
end

NOTE: Only one of the values has to be converted into a Float for the whole return value to become a Float.

=end
