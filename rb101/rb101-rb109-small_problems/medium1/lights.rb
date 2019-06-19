def switch(light)
  light == 'off' ? 'on' : 'off'
end

def initialize_lights(number_of_lights)
  lights = {}
  (1..number_of_lights).each { |num| lights[num] = 'off' }
  lights
end

def toggle_lights(lights)
  (1..lights.size).each do |num|
    lights.each_key do |key|
      lights[key] = switch(lights[key]) if (key % num).zero?
    end
  end
end

def on_lights(lights)
  lights.select { |_, v| v == 'on' }.keys
end

def lightswitch(number_of_lights)
  lights = initialize_lights(number_of_lights)
  toggle_lights(lights)
  on_lights(lights)
end

p lightswitch(5) == [1, 4]
p lightswitch(10) == [1, 4, 9]
p lightswitch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100,
                        121, 144, 169, 196, 225, 256, 289, 324,
                        361, 400, 441, 484, 529, 576, 625, 676,
                        729, 784, 841, 900, 961]

# FURTHER EXPLORATION:

# 1)
# This is because all of the lights start in the 'off' position.
# In order for them to be turned 'on' they must go through an odd
# number of toggles. Think of toggles as factors through each
# iteration's number. Thus, since squares are the only numbers
# with an odd number of factors/divisors, all of the square-numbered
# lights are left in the 'on' position.

# 2)
# If we used an array to represent our lights we could use a nested
# array structure and 'switch' the lights by accessing the element at
# index 1 of every nested array back and forth. Then select the 'on'
# sub-arrays. Then extract all of the light numbers of said sub-arrays:

# def switch(light)
#   light == 'off' ? 'on' : 'off'
# end

# def initialize_lights(number_of_lights)
#   lights = []
#   (1..number_of_lights).each { |light| lights << [light, 'off'] }
#   lights
# end

# def toggle_lights(lights)
#   (1..lights.size).each do |num|
#     lights.each do |light|
#       light[1] = switch(light[1]) if (light[0] % num).zero?
#     end
#   end
# end

# def on_lights(lights)
#   switched_on = lights.select { |light| light[1] == 'on' }
#   switched_on.flatten.keep_if { |item| item.class == Integer }
# end

# def lightswitch(number_of_lights)
#   lights = initialize_lights(number_of_lights)
#   toggle_lights(lights)
#   on_lights(lights)
# end

# 3)
# def switch(light)
#   light == 'off' ? 'on' : 'off'
# end

# def initialize_lights(number_of_lights)
#   lights = {}
#   (1..number_of_lights).each { |num| lights[num] = 'off' }
#   lights
# end

# def toggle_lights(lights)
#   (1..lights.size).each do |num|
#     lights.each_key do |key|
#       lights[key] = switch(lights[key]) if (key % num).zero?
#     end
#   end
# end

# def lights_status(lights, status)
#   lights.select { |_, v| v == status }.keys
# end

# def lights_status_list(lights, status)
#   if lights.size > 2
#     "lights #{lights[0..-2].join(', ')}, and #{lights[-1]} are now #{status}"
#   elsif lights.size == 2
#     "lights #{lights[0]} and #{lights[1]} are now #{status}"
#   elsif lights.size == 1
#     "light #{lights[0]} is now #{status}"
#   else
#     "no lights are #{status}"
#   end
# end

# def display_lights_status(number_of_lights)
#   lights = initialize_lights(number_of_lights)
#   toggle_lights(lights)
#   switched_off = lights_status(lights, 'off')
#   switched_on = lights_status(lights, 'on')
#   puts "#{lights_status_list(switched_off, 'off')}; " \
#        "#{lights_status_list(switched_on, 'on')}."
# end

# display_lights_status(0)
# display_lights_status(2)
# display_lights_status(5)
# display_lights_status(10)
