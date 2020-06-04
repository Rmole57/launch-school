class Clock
  def initialize(hours, minutes = 0)
    seconds = (60**2 * hours) + (60 * minutes)
    @time = Time.at(seconds, in: "+00:00")
  end

  class << self
    alias at new
  end

  def to_s
    @time.strftime("%R")
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def +(minutes)
    new_time = @time + (60 * minutes)
    Clock.new(new_time.hour, new_time.min)
  end

  def -(minutes)
    new_time = @time - (60 * minutes)
    Clock.new(new_time.hour, new_time.min)
  end
end
