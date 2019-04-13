def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


=begin

ALTERNATIVE SOLUTIONS:

(To account for odd numbers and cents.)

def calculate_bonus(salary, bonus)
  salary = salary.to_f.round(2)

  bonus ? ((salary / 2).round(2)) : 0
end

=end
