arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hsh|
  hsh.values.all? do |value|
    value.all?(&:even?)
  end
end

p new_arr

# ALTERNATIVE SOLUTIONS:

# new_arr = arr.select do |hsh|
#   hsh.all? do |_, value|
#     value.all? { |num| num.even? }
#   end
# end

# new_arr = arr.select do |hsh|
#   hsh.values.flatten.all?(&:even?)
# end
