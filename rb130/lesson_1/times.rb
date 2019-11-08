def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number # Note the return value should be the calling object, like the Integer#times method.
end

times(5) do |num|
  puts num
end
