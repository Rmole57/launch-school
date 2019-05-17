ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age_sum = ages.values.sum

p age_sum

# ALTERNATIVE SOLUTIONS:

# 1)
# age_sum = 0
# ages.each_value { |age| age_sum += age }

# 2)
# total_ages = 0
# ages.each { |_,age| total_ages += age }
# total_ages

# 3)
# ages.values.inject(:+)
