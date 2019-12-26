def egyptian(rational_num)
  result = []
  sum = 0
  denom = 1
  until sum == rational_num
    if (sum + Rational(1, denom)) <= rational_num
      sum += Rational(1, denom)
      result << denom
    end
    denom += 1
  end
  result
end

def unegyptian(arr)
  result = 0
  arr.each do |denom|
    result += Rational(1, denom)
  end
  result
end

p egyptian(Rational(2, 1)) == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# ALTERNATIVE SOLUTION:

# def egyptian(target_value)
#   denominators = []
#   unit_denominator = 1
#   until target_value == 0
#     unit_fraction = Rational(1, unit_denominator)
#     if unit_fraction <= target_value
#       target_value -= unit_fraction
#       denominators << unit_denominator
#     end

#     unit_denominator += 1
#   end

#   denominators
# end

# def unegyptian(denominators)
#   denominators.inject(Rational(0)) do |accum, denominator|
#     accum + Rational(1, denominator)
#   end
# end
