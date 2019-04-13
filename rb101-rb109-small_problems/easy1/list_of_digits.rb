def digit_list(num)
  num.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]


=begin

ALTERNATIVE SOLUTIONS:

(If you can't use Integer#digits method):

def digit_list(num)
  digits = []
  
  until num == 0
    digits << num % 10
    num /= 10
  end

  digits.reverse
end

(Brute Force):

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

(Idiomatic Ruby):

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

=end
