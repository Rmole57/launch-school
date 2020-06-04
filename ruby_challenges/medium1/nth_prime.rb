class Prime
  class << self
    def nth(n)
      raise ArgumentError if n < 1

      @primes = [2]
      curr_num = 3

      until @primes.size == n
        @primes << curr_num if prime?(curr_num)
        curr_num += 2
      end

      @primes.last
    end

    private

    def prime?(num)
      @primes.each do |divisor|
        return false if (num % divisor).zero?
        return true if divisor >= Math.sqrt(num)
      end
    end
  end
end
