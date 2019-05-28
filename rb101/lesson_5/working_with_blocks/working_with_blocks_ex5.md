QUESTION:

Map out a detailed breakdown for the following code:
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

ANSWER:

Expected output:
```ruby
# => [[2, 4], [6, 8]]
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
b) method call `map`
c) `[[1, 2], [3, 4]]`
d) None
e) `[[2, 4], [6, 8]]`
f) No, but output is shown

a) 1-5
b) outer block execution
c) `[[1, 2], [3, 4]]`
d) None
e) A new array: `[[2, 4], [6, 8]]`
f) Yes, used by top-level `map` for transformation

a) 2
b) method call `map`
c) Each sub-array
d) None
e) New transformed sub-array
f) Yes, to determine the return value of the outer block

a) 2-4
b) inner block execution
c) Each element in sub-array
d) None
e) An integer
f) Yes, used by inner-level `map` for transformation

a) 3
b) `num * 2`
c) n/a
d) None
e) An integer
f) Yes, used to determine the return value of the inner block
