advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, advice.index('house'))
p advice

# BONUS:

# If you use String#slice instead, the original string 'advice'
# will remain unmodified as #slice is not a destructive method.

# ALTERNATIVE SOLUTIONS:

# advice.slice!('Few things in life are as important as ')

# advice.slice!(0...advice.index('house'))
