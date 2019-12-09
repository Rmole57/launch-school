class Octal
  attr_reader :oct_num

  def initialize(oct_num)
    @oct_num = oct_num
  end

  def to_decimal
    dec_num = 0

    unless oct_num =~ /[\D89]+/
      digits = oct_num.reverse.chars.map(&:to_i)
      
      digits.each_with_index do |digit, idx|
        dec_num += digit * 8**idx
      end
    end

    dec_num
  end
end
