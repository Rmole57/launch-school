def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# ALTERNATIVE SOLUTION:

# The below solution specifies a pattern argument for #split.
# According to its documentation, #split will automatically
# use the whitespace argument ' ' when no pattern (or nil) is
# specified:

# def swap_name(name)
#   name.split(' ').reverse.join(', ')
# end
