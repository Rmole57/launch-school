DEGREE = "\xC2\xB0".freeze
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(angle)
  total_seconds = (angle * SECONDS_PER_DEGREE).round
  degrees, remainder = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remainder.divmod(SECONDS_PER_MINUTE)

  degrees %= 360

  format(%(%d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
p dms(-76.73) == %(283°16'12")

# ALTERNATIVE SOLUTION:

# def dms(angle)
#   degrees = angle
#   minutes = ((angle % 1) * 60)
#   seconds = ((minutes % 1) * 60)

#   degrees %= 360

#   format(%(%d#{DEGREE}%02d'%02d"), degrees.to_i, minutes.to_i, seconds.to_i)
# end

# With this solution some of the calculations may be off by one second.
