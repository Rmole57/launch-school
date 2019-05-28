arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

result_hsh = arr.each_with_object({}) do |sub_arr, hsh|
  hsh[sub_arr[0]] = sub_arr[1]
end

p result_hsh

# ALTERNATIVE SOLUTION:

# hsh = {}
# arr.each do |item|
#   hsh[item[0]] = item[1]
# end
# hsh
