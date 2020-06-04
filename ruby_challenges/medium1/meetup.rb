require 'date'

class Meetup
  SCHEDULE_START_DAYS = {
    first: 1, second: 8, third: 15,
    fourth: 22, teenth: 13, last: -7
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    start_date = Date.new(@year, @month, SCHEDULE_START_DAYS[schedule])
    end_date = start_date + 6

    (start_date..end_date).find { |day| day.send(weekday.to_s + '?') }
  end
end

# ALTERNATIVE SOLUTION:

# class Meetup
#   SCHEDULE_START_DAYS = {
#     first: 1, second: 8, third: 15,
#     fourth: 22, teenth: 13, last: -7
#   }

#   WEEKDAYS = [:sunday, :monday, :tuesday,
#               :wednesday, :thursday, :friday,
#               :saturday, :sunday]

#   def initialize(month, year)
#     @month = month
#     @year = year
#   end

#   def day(weekday, schedule)
#     start_date = Date.new(@year, @month, SCHEDULE_START_DAYS[schedule])
#     end_date = start_date + 6

#     start_date.step(end_date) do |day|
#       return day if day.wday == WEEKDAYS.index(weekday)
#     end
#   end
# end
