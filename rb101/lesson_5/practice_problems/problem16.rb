HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f).freeze

def generate_uuid
  uuid = ''
  sections = [8, 4, 4, 4, 12]

  sections.each_with_index do |section, idx|
    section.times { |_| uuid << HEX.sample }
    uuid << '-' if idx < sections.size - 1
  end

  uuid
end

puts generate_uuid

# ALTERNATIVE SOLUTION:

# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end
