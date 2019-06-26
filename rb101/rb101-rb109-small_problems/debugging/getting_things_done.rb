# Original program:

# def move(n, from_array, to_array)
#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# Example

# todo = ['study', 'walk the dog', 'coffee with Tom']
# done = ['apply sunscreen', 'go to the beach']

# move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# Fixed code:

# The SystemStackError occurs because you've used up too much memory on the stack.
# This is a 'stack overflow' essentially and it's occurring because you're calling
# a recursive method infinite number of times because there is no base case.

def move(n, from_array, to_array)
  return if n <= 0

  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo == ['coffee with Tom']
p done == ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# FURTHER EXPLORATION:

# If 'from_array' is smaller than 'n' then the method adds a 'nil' object for
# each iteration performed on the empty 'from_array'. Remember that 'nil' objects
# are valid elements in a collection.

# To account for this, simply add another condition to the base case:

# def move(n, from_array, to_array)
#   return if n <= 0 || from_array.empty?

#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# Example

# todo = ['study']
# done = ['apply sunscreen', 'go to the beach']

# move(3, todo, done)

# p todo == []
# p done == ['apply sunscreen', 'go to the beach', 'study']
