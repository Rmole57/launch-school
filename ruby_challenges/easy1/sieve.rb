class Sieve
  attr_reader :limit, :num_list

  def initialize(limit)
    @limit = limit
    @num_list = (2..limit).to_a
  end

  def primes
    num_list.each do |num|
      (num * 2..limit).step(num) { |mult| num_list.delete(mult) }
    end
    num_list
  end
end

# ALTERNATIVE SOLUTIONS:

# 1)
# class Sieve
#   def initialize(limit)
#     @limit = limit
#     mark_num_list
#   end

#   def primes
#     num_list.keys.select { |num| num_list[num] == 'prime' }
#   end

#   private

#   attr_reader :limit
#   attr_accessor :num_list

#   def setup_num_list
#     @num_list = {}
#     (2..limit).each { |num| num_list[num] = nil }
#   end

#   def mark_num_list
#     setup_num_list
#     num_list.each_key do |num|
#       unless num_list[num]
#         num_list[num] = 'prime'
#         (num * 2..limit).step(num) { |mult| num_list[mult] = 'composite' }
#       end
#     end
#   end
# end

# 2)
# class Sieve
#   attr_reader :num_list

#   def initialize(limit)
#     @num_list = (2..limit).to_a
#   end

#   def primes
#     num_list.each do |num|
#       num_list.reject! { |mult| (mult != num) && (mult % num == 0) }
#     end
#     num_list
#   end
# end
