class Series
  attr_reader :digits

  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > digits.size
    digits.each_cons(n).to_a
  end
end
