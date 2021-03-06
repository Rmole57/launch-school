def remove_vowels(string_array)
  string_array.map { |string| string.gsub(/[aeiou]/i, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# ALTERNATIVE SOLUTION:

# def remove_vowels(string_array)
#   string_array.map { |string| string.delete('aeiouAEIOU') }
# end
