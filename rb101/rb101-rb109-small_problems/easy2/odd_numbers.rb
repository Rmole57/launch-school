(1..99).each { |num| puts num if num.odd? }

# ALTERNATIVE SOLUTIONS:

# 1) 1.upto(99) { |num| puts num if num % 2 != 0 }

# 2) puts (1..99).select { |num| num.odd? }

# 3) value = 1
#    while value <= 99
#      puts value
#      value += 2
#    end
