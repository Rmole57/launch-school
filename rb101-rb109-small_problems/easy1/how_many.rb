def count_occurrences(arr)
  element_occurrences = {}

  arr.each do |element|
    element_occurrences[element] = arr.count(element)
  end

  element_occurrences.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)


=begin

FURTHER EXPLORATION:

QUESTION:

Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

ANSWER:

def count_occurrences(arr)
  element_occurrences = {}

  arr.map! { |element| element.to_s.downcase }

  arr.each do |element|
    element_occurrences[element] = arr.count(element)
  end

  element_occurrences.each do |key, value|
    puts "#{key} => #{value}"
  end
end

=end
