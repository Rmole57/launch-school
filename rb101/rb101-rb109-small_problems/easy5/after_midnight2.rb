HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_to_minutes(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR) + minutes
end

def after_midnight(time)
  time_to_minutes(time) % MINUTES_PER_DAY
end

def before_midnight(time)
  (MINUTES_PER_DAY - time_to_minutes(time)) % MINUTES_PER_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# ALTERNATIVE SOLUTIONS:

# 1)
# def time_to_minutes(time)
#   time = time.split(':').map(&:to_i)
#   (time[0] * 60) + time[1]
# end

# def after_midnight(time)
#   return 0 unless (1..1439).cover?(time_to_minutes(time))
#   time_to_minutes(time)
# end

# def before_midnight(time)
#   return 0 unless (1..1439).cover?(time_to_minutes(time))
#   1440 - time_to_minutes(time)
# end

# 2)
# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

# FURTHER EXPLORATION:

# require 'time'

# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
# SECONDS_PER_MINUTE = 60
# MIDNIGHT = Time.parse('00:00')

# def time_to_minutes(time)
#   change_in_seconds = Time.parse(time) - MIDNIGHT
#   change_in_minutes = change_in_seconds / SECONDS_PER_MINUTE
# end

# def after_midnight(time)
#   time_to_minutes(time) % MINUTES_PER_DAY
# end

# def before_midnight(time)
#   (MINUTES_PER_DAY - time_to_minutes(time)) % MINUTES_PER_DAY
# end
