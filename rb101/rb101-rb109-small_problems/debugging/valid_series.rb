# Original program:

# def valid_series?(nums)
#   return false if nums.sum != 47

#   odd_count = nums.count { |n| n.odd? }
#   odd_count = 3 ? true : false
# end

# Fixed code:

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# The program was originally assigning the variable 'odd_count'
# to 3 in the ternary operator. So if the sum of the numbers
# was 47 the method would always return true because 'odd_count'
# would always be 3. To fix this you need to test for equality with
# '==' in the ternary operator.

# FURTHER EXPLORATION:

# No, the ternary operator isn't necessary. You could simply write:

# def valid_series?(nums)
#   return false if nums.sum != 47

#   odd_count = nums.count { |n| n.odd? }
#   odd_count == 3
# end

# This would behave the same way since the equality comparison on the
# last line of the method returns a Boolean anyway!
