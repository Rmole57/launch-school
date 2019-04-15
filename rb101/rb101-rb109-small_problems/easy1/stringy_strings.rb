def stringy(num)
  string = ''
  counter = 0

  while counter < num
    counter.even? ? string << '1' : string << '0'
    counter += 1
  end

  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# ALTERNATIVE SOLUTIONS:

# def stringy(size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end

#   numbers.join
# end

# FURTHER EXPLORATION:

# Modify stringy so it takes an optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should
# return a String of alternating 0s and 1s, but starting with 0 instead of 1.

# ANSWER:

# def stringy(num, start = 1)
#   string = ''
#   counter = 0

#   while counter < num
#     if start == 0
#       counter.even? ? string << '0' : string << '1'
#     else
#       counter.even? ? string << '1' : string << '0'
#     end
#     counter += 1
#   end

#   string
# end

# NOTE: This method doesn't verify that if an argument for 'start' is provided
# that it is only a 0 or a 1. Would clarify if this is necessary with the
# interviewer in an interview setting for edge/test cases. But could add a
# simple check like this:

# def stringy(num, start = 1)

#   return puts "Second argument must be a 0 or a 1 if supplied!" if start != 1 && start != 0

#   string = ''
#   counter = 0

#   while counter < num
#     if start == 0
#       counter.even? ? string += '0' : string += '1'
#     else
#       counter.even? ? string += '1' : string += '0'
#     end
#     counter += 1
#   end

#   string
# end
