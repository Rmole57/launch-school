def repeat(string, number)
  number.times do
    puts string
  end
end

repeat('Hello', 3)

# ALTERNATIVE SOLUTIONS:

# def repeat(string, number)
#   counter = 0
#   until counter == number
#     puts string
#     counter += 1
#   end
# end
