flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones = flintstones.assoc('Barney')

p flintstones

# ALTERNATIVE SOLUTION (without Array#assoc method):

# flintstones = flintstones.select { |key, _| key == 'Barney' }.flatten
