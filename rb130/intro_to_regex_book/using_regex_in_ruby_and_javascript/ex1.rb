def url?(str)
  str.match?(/\Ahttps?:\/\/\S+\z/)
end

p url?('http://launchschool.com')   # => true
p url?('https://example.com')       # => true
p url?('https://example.com hello') # => false
p url?('   https://example.com')    # => false

# ALTERNATIVE SOLUTION:

# def url?(text)
#   !!text.match(/\Ahttps?:\/\/\S+\z/)
# end
