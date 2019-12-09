class Trinary
  attr_reader :tri_num

  def initialize(tri_num)
    @tri_num = tri_num
  end

  def to_decimal
    dec_num = 0

    unless tri_num =~ /[\D3-9]+/
      digits = tri_num.reverse.chars.map(&:to_i)

      digits.each_with_index do |digit, idx|
        dec_num += digit * 3**idx
      end
    end

    dec_num
  end
end
