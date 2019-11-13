def max_by(array)
  return nil if array.empty?

  max_val = array.first
  largest_yield = yield(max_val)

  array[1..-1].each do |curr_el|
    current_yield = yield(curr_el)
    if largest_yield < current_yield
      largest_yield = current_yield
      max_val = curr_el
    end
  end

  max_val
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
