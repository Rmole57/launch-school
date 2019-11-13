def step(start_val, end_val, increment)
  counter = start_val
  loop do
    yield(counter)
    break if counter + increment > end_val
    counter += increment
  end
  counter
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
