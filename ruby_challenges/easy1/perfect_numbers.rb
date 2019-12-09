class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0

    sum = (1...num).reduce(0) { |acc, div| (num % div).zero? ? acc + div : acc }

    if sum < num
      'deficient'
    elsif sum > num
      'abundant'
    else
      'perfect'
    end
  end
end
