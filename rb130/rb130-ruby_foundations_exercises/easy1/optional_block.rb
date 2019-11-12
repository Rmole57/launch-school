def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# ALTERNATIVE SOLUTION:

# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# FURTHER EXPLORATION:

# def compute(arg)
#   return 'Does not compute.' unless block_given?
#   yield(arg)
# end

# p compute('Ho') { |str| str * 3 } == 'HoHoHo'
# p compute([1, 2, 3]) { |nums| nums.sum } == 6
# p compute('Hey') == 'Does not compute.'
