QUESTION:

Map out a detailed breakdown for the following code:
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

ANSWER:

Expected output:
```ruby
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
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
b) variable assignment
c) n/a
d) None
e) `[[18, 7], [3, 12]]`
f) No

a) 1
b) method call (`each`)
c) Outer array
d) None
e) The calling object: `[[18, 7], [3, 12]]`
f) Yes, to assign to `my_arr` variable

a) 1-7
b) outer block execution
c) Each sub-array
d) None
e) Each sub-array
f) No

a) 2
b) method call (`each`)
c) Each sub-array
d) None
e) Current sub-array in iteration
f) Yes, to determine the value of the outer block

a) 2-6
b) inner block execution
c) Each element of the sub-array
d) None
e) `nil`
f) No

a) 3
b) comparison `>`
c) Current element in iteration
d) None
e) Boolean
f) Yes, to be evaluated by `if`

a) 3-5
b) conditional `if`
c) Current element in iteration
d) None
e) `nil`
f) Yes, to determine return value of inner block

a) 4
b) method call `puts`
c) Current element in iteration
d) Outputs string representation of Integer
e) `nil`
f) Yes, to determine the value of the inner block
