def divisors(num)
  (1..num).select { |divisor| (num % divisor).zero? }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) ==  [1, 999979, 999983, 999962000357]

# FURTHER EXPLORATION:

# def divisors(num)
#   (1..Math.sqrt(num).to_i).each_with_object([]) do |div, result|
#     result.concat([div, num / div]) if (num % div).zero?
#   end.sort.uniq
# end
