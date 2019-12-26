class Luhn
  def initialize(num)
    @num = num
  end

  def checksum
    addends.sum
  end

  def addends
    digits = @num.digits
    digits.map.with_index do |digit, idx|
      if idx.odd?
        digit * 2 >= 10 ? digit * 2 - 9 : digit * 2
      else
        digit
      end
    end.reverse
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(partial_num)
    new_num = partial_num * 10
    new_luhn = Luhn.new(new_num)

    new_luhn.valid? ? new_num : new_num + (10 - (new_luhn.checksum % 10))
  end
end

# ALTERNATIVE SOLUTION:

# (Original Solution - Notice the difference in the Luhn::create methods!)
# class Luhn
#   def initialize(num)
#     @num = num
#   end

#   def checksum
#     addends.sum
#   end

#   def addends
#     digits = @num.digits
#     digits.map.with_index do |digit, idx|
#       if idx.odd?
#         digit * 2 >= 10 ? digit * 2 - 9 : digit * 2
#       else
#         digit
#       end
#     end.reverse
#   end

#   def valid?
#     checksum % 10 == 0
#   end

#   def self.create(partial_num)
#     check_digit = 0
#     new_num = 0

#     loop do
#       new_num = partial_num.digits.reverse.push(check_digit).join.to_i
#       break if new(new_num).valid?
#       check_digit += 1
#     end

#     new_num
#   end
# end
