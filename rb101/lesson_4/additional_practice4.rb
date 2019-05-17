ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum_age = ages.values.min
p minimum_age

# ALTERNATIVE SOLUTIONS:

# 1)
# minimum_age = ages.values.sort[0]

# 2)
# minimum_age = ages.sort_by { |name, age| ages[name] = age }[0][1]

# 3)
# minimum_age = ages.min_by { |name, age| ages[name] = age }[1]
