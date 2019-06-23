def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    thirteenth = Time.new(year, month, 13)
    count += 1 if thirteenth.friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# ALTERNATIVE SOLUTION:

# require 'date'

# def friday_13th(year)
#   unlucky_count = 0
#   thirteenth = Date.new(year, 1, 13)
#   12.times do
#     unlucky_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_count
# end

# FURTHER EXPLORATION:

# require 'date'

# def initialize_day_amounts(year)
#   days_amounts = {
#     1 => 31, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
#     7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30,
#     12 => 31
#   }
#   days_amounts[2] = Date.new(year).leap? ? 29 : 28

#   days_amounts
# end

# def five_fridays(year)
#   months = []
#   days_amounts = initialize_day_amounts(year)

#   days_amounts.each do |month, days|
#     count = 0
#     1.upto(days) do |day|
#       count += 1 if Date.new(year, month, day).friday?
#     end
#     months << month if count == 5
#   end

#   months
# end

# p five_fridays(2015)
# p five_fridays(1986)
# p five_fridays(2019)
# p five_fridays(1976) # leap year
# p five_fridays(2004) # leap year
# p five_fridays(1984) # leap year
