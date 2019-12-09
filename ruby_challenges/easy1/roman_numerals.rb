class Integer
  ROMAN_NUMERALS = {
    'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
    'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
    'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4,
    'I' => 1
  }

  def to_roman
    original_num = self
    roman_num = ''

    ROMAN_NUMERALS.each do |roman_val, dec_val|
      while original_num - dec_val >= 0
        roman_num << roman_val
        original_num -= dec_val
      end
    end

    roman_num
  end
end

# ALTERNATIVE SOLUTIONS:

# 1 - (video solution)
# class Integer
#   ROMAN_NUMERALS = {
#     'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
#     'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
#     'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4,
#     'I' => 1
#   }

#   def to_roman
#     original_num = self
#     roman_num = ''

#     ROMAN_NUMERALS.each do |roman_val, dec_val|
#       number_of_roman_letters = original_num / dec_val
#       roman_num << roman_val * number_of_roman_letters
#       original_num -= dec_val * number_of_roman_letters
#     end

#     roman_num
#   end
# end

# 2 - (classmate's solution that was interesting)
# class Integer
#   ROMAN_NUMERALS = {
#     'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
#     'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
#     'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4,
#     'I' => 1
#   }

#   def to_roman
#     remainder = self

#     ROMAN_NUMERALS.each_with_object([]) do |(roman_letter, num), result|
#       quotient, remainder = remainder.divmod(num)
#       result << roman_letter * quotient
#     end.join
#   end
# end
