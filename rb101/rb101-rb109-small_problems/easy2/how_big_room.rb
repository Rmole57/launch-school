SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03

def retrieve_info
  puts 'Enter the length of the room in feet:'
  length = gets.to_f

  puts 'Enter the width of the room in feet:'
  width = gets.to_f

  [length, width]
end

def calculate_area(length, width)
  (length * width).round(2)
end

def feet_to_inches(area)
  (area * SQFEET_TO_SQINCHES).round(2)
end

def feet_to_centimeters(area)
  (area * SQFEET_TO_SQCENTIMETERS).round(2)
end

def display_area_of_room(feet, inches, centimeters)
  puts "The area of the room is #{feet} square feet" \
       " (#{inches} square inches," \
       " #{centimeters} square centimeters)."
end

length, width = retrieve_info

area_feet = calculate_area(length, width)
area_inches = feet_to_inches(area_feet)
area_centimeters = feet_to_centimeters(area_feet)

display_area_of_room(area_feet, area_inches, area_centimeters)
