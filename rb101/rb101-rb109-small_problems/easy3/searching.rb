def prompt(message)
  puts "==> #{message}"
end

def number_place(num)
  case num % 10
  when 1
    num.to_s + 'st'
  when 2
    num.to_s + 'nd'
  when 3
    num.to_s + 'rd'
  else
    num.to_s + 'th'
  end
end

nums = []
6.times do |iteration|
  if iteration < 5
    prompt("Enter the #{number_place(iteration + 1)} number:")
  else
    prompt('Enter the last number:')
  end
  nums << gets.to_i
end

last_num = nums.pop

if nums.include?(last_num)
  puts "The number #{last_num} appears in #{nums}."
else
  puts "The number #{last_num} does not appear in #{nums}."
end
