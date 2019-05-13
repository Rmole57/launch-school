MINUTES_PER_DAY = 1440

def time_of_day(time_change)
  time_change %= MINUTES_PER_DAY
  hours, minutes = time_change.divmod(60)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# ALTERNATIVE SOLUTION:

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def time_of_day(delta_minutes)
#   delta_minutes =  delta_minutes % MINUTES_PER_DAY
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# FURTHER EXPLORATION:

# SECONDS_PER_MINUTE = 60

# def time_of_day(delta_minutes)
#   time = Time.new(2019, 5, 12)
#   delta_seconds = delta_minutes * SECONDS_PER_MINUTE
#   time += delta_seconds
#   time.strftime('%A %H:%M')
# end
