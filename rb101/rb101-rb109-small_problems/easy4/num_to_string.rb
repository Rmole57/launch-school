DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze

def integer_to_string(number)
  value = ''
  loop do
    value.prepend(DIGITS[number % 10])
    number /= 10
    break if number.zero?
  end
  value
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

# ALTERNATIVE SOLUTIONS:

# 1)
# def integer_to_string(number)
#   number.digits.reverse.join
# end

# 2)
# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end

# FURTHER EXPLORATION:

# Could only find one "bang" method that had no 
# non-mutating equivalent in its class, Array#sort_by!
# However, there is the non-mutating Enumerable#sort_by
# that Array objects have access to so that could be
# considered the non-mutating option.

# String mutating methods without the "bang":
# <<
# []=
# clear
# concat
# insert
# replace
# prepend

# Array mutating methods without the "bang":
# <<
# []=
# append
# clear
# concat
# delete
# delete_at
# delete_if
# fill
# insert
# keep_if
# pop
# prepend
# push
# replace
# unshift

# Hash mutating methods without the "bang":
# []=
# clear
# delete
# delete_if
# keep_if
# rehash
# replace
# shift
# store
# update
