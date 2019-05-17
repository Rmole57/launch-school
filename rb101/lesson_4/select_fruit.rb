def select_fruit(produce)
  count = 0
  produce_keys = produce.keys
  selected_fruits = {}

  loop do
    # This needs to be at the top in the event that 'produce' is an empty hash.
    break if count == produce.size

    current_key = produce_keys[count]
    current_value = produce[produce_keys[count]]

    selected_fruits[current_key] = current_value if current_value == 'Fruit'

    count += 1
  end
  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)
p select_fruit({})
