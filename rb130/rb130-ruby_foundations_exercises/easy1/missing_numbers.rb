def missing(nums)
  missing_nums = []

  (nums[0]..nums[-1]).each do |num|
    missing_nums << num unless nums.include?(num)
  end

  missing_nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# ALTERNATIVE SOLUTION:

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# FURTHER EXPLORATION:

# 1)
# See original solution!

# 2)
# def missing(nums)
#   result = []

#   (nums[0]).upto(nums[-1]) do |num|
#     result << num unless nums.include?(num)
#   end

#   result
# end

# 3) - Without using a method that requires block
# def missing(nums)
#   (nums.first..nums.last).to_a - nums
# end

# 4)
# def missing(nums)
#   result =[]

#   curr_el = nums.first
#   end_el = nums.last

#   while curr_el < end_el
#     result << curr_el unless nums.include?(curr_el)
#     curr_el += 1
#   end

#   result
# end

# 5)
# def missing(nums)
#   (nums[0]..nums[-1]).select { |num| !nums.include?(num) }
# end

# 6) - Without using a method that requires block (this could also technically be used for unsorted/unordered arrays)
# def missing(nums)
#   (nums.min..nums.max).to_a - nums
# end
