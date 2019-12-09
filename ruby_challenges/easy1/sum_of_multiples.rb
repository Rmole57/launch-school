class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end

  def to(limit)
    sum = 0

    (1...limit).each do |num|
      sum += num if multiples.any? { |multiple| (num % multiple).zero? }
    end

    sum
  end
end

# ALTERNATIVE SOLUTIONS:

# 1 - Original Solution
# class SumOfMultiples
#   attr_reader :multiples

#   def initialize(*multiples)
#     @multiples = multiples
#   end

#   def self.to(limit)
#     sum = 0

#     (1...limit).each do |num|
#       [3, 5].each do |multiple|
#         if (num % multiple).zero?
#           sum += num
#           break
#         end
#       end
#     end

#     sum
#   end

#   def to(limit)
#     sum = 0

#     (1...limit).each do |num|
#       multiples.each do |multiple|
#         if (num % multiple).zero?
#           sum += num
#           break
#         end
#       end
#     end

#     sum
#   end
# end

# 2 - Fellow student's submission that I thought was interesting
# class SumOfMultiples
#   attr_reader :multiples

#   def initialize(*multiples)
#     @multiples = multiples
#   end

#   def self.to(limit, multiples = [3, 5])
#     (1...limit).select do |num|
#       multiples.any? { |multiple| (num % multiple).zero? }
#     end.sum
#   end

#   def to(limit)
#     self.class.to(limit, multiples)
#   end
# end
