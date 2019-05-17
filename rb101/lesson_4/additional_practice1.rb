flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = flintstones.to_h { |name| [name, flintstones.index(name)] }
p flintstones_hash

# ALTERNATIVE SOLUTION:

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end
