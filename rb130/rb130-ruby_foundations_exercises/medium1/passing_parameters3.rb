items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

gather(items) do |apples, *vegetables, wheat|
  puts apples
  puts vegetables.join(', ')
  puts wheat
end

gather(items) do |apples, *assorted|
  puts apples
  puts assorted.join(', ')
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

# FURTHER DISCUSSION:

# Below is the LS demonstration of how altering the method to fit specific requirements is
# acceptable, but in this case is cumbersome and not nearly as flexible as yielding to a
# block and allowing the method caller to refine the method as they see fit via the block:

# 1
# def gather(*produce, wheat)
#   puts "Let's start gathering food."
#   p produce
#   puts wheat
#   puts "We've finished gathering!"
# end

# 2
# def gather(apples, *vegetables, wheat)
#   puts "Let's start gathering food."
#   puts apples
#   p vegetables
#   puts wheat
#   puts "We've finished gathering!"
# end

# 3
# def gather(apples, *assorted)
#   puts "Let's start gathering food."
#   puts apples
#   p assorted
#   puts "We've finished gathering!"
# end

# 4
# def gather(apples, corn, cabbage, wheat)
#   puts "Let's start gathering food."
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
#   puts "We've finished gathering!"
# end

# method call

# gather(*items) # notice we need a splat operator for passing in that array now.
