QUESTION:

Map out a detailed breakdown for the following code:
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

ANSWER:

Expected output:
```ruby
# 1
# 3
# => [1, 3]
```

Categories:
a) Line
b) Action
c) Object
d) Side Effect
e) Return Value
f) Is Return Value Used?

Breakdown:
a) 1
b) method call (`map`)
c) The outer array
d) None
e) New array `[1, 3]`
f) No, but output is shown

a) 1-4
b) block execution
c) Each sub-array
d) None
e) None
f) Yes, used by `map` for transformation

a) 2
b) method call (`first`)
c) Each sub-array
d) None
e) The object at index 0 of sub-array
f) Yes, used by `puts`

a) 2
b) method call (`puts`)
c) Each sub-array
d) Yes, outputs a string representation of an Integer
e) `nil`
f) No

a) 3
b) method call (`first`)
c) Each sub-array
d) None
e) The object at index 0 of sub-array
f) Yes, used to determine the value of the block
