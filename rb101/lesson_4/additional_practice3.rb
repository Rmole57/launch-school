ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age >= 100 }
p ages

# ADDITIONAL SOLUTIONS:

# 1)
# ages.keep_if { |_, age| age < 100 }

# 2)
# ages.select! { |_, age| age < 100 }
