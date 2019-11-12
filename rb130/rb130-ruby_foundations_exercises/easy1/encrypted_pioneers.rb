ENCRYPTED_PIONEERS = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
].freeze

def rot13(encrypted_text)
  encrypted_text.split('').map { |char| decipher_character(char) }.join
end

def decipher_character(char)
  case char
  when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
  else
    char
  end
end

ENCRYPTED_PIONEERS.each { |pioneer| puts rot13(pioneer) }

# ALTERNATIVE SOLUTIONS:

# 1) - Launch School solution
# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

# 2) - An interesting solution from another student
# def rot13(string)
#   string.tr("a-zA-Z", "n-za-mN-ZA-M")
# end

# 3) - A generic version using our own hard-coded alphabet arrays and their indices
# def rot13(encrypted_text)
#   encrypted_text.split('').map { |char| decipher_character(char) }.join
# end

# def decipher_character(char)
#   lower_case = ('a'..'z').to_a
#   upper_case = ('A'..'Z').to_a

#   if lower_case.include?(char)
#     rotate_char(lower_case, char)
#   elsif upper_case.include?(char)
#     rotate_char(upper_case, char)
#   else
#     char
#   end
# end

# def rotate_char(alpha_arr, char)
#   if alpha_arr.index(char) < 13
#     alpha_arr[alpha_arr.index(char) + 13]
#   else
#     alpha_arr[alpha_arr.index(char) - 13]
#   end
# end

# FURTHER EXPLORATION:

# Running this program on data that uses the EBCDIC representation could
# drastically change and complicate our implementation (of course this
# depends on the problem requirements and the specific type of input).

# Currently, our algorithm is based off of using the ASCII ordinals of the characters.
# The methods we use are designed to work directly with the ASCII representation. However,
# EBCDIC and ASCII have very clear differences in how they encode the letters of the
# alphabet. For example, in ASCII, upper case letters come first, then lower case. In
# EBCDIC, it's the opposite. But what's even more complicated is that, unlike ASCII,
# the code points for the letters of the alphabet are not consecutive in EBCDIC. There
# are gaps in both the lower case alphabet and the upper case alphabet.

# So trying to apply an encryption key like Rot13 directly would be a bit difficult since
# you can't just increment or decrement by 13 places the code point value since not all
# of the letters are consecutive.

# All that being said, if the data given to us is the string representation of the
# EBCDIC encoding, we could just convert it to ASCII using String#encode, carry out
# our implementation as is, and then output the result:

# def rot13(encrypted_text)
#   ascii_version = encrypted_text.encode("ASCII", "IBM037") # after some digging, found that "IBM037" is the encoding name for EBCDIC
#   ascii_version.split('').map { |char| decipher_character(char) }.join
# end

# def decipher_character(char)
#   case char
#   when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
#   else
#     char
#   end
# end

# # Finding the EBCDIC string representation to use as a test case:
# orig_encrypt = "Lhxvuveb Zngfhzbgb"
# ebcdic_encrypt = orig_encrypt.encode("IBM037") # => "\xD3\x88\xA7\xA5\xA4\xA5\x85\x82\x40\xE9\x95\x87\x86\x88\xA9\x82\x87\x82"

# # Test case:
# p rot13("\xD3\x88\xA7\xA5\xA4\xA5\x85\x82\x40\xE9\x95\x87\x86\x88\xA9\x82\x87\x82") # => "Yukihiro Matsumoto"

# But again, this is assuming a very specific type of input. Notice the '\x' prefix
# in the EBCDIC encoding. In Ruby, this is a 'hex escape' sequence, which denotes
# a hex number/representation. So if the input did not include this sequence as a
# delimiter, you would have to replace/substitute whatever delimiter the input
# currently has (if any) with a hex escape sequence, in order to convert it into a
# proper string representation of EBCDIC encoding. 

# Or maybe the input is just a straight hexadecimal string providing no escape 
# characters. In this case, the String#unpack and Array#pack methods might be of use:

# def rot13(encrypted_text)
#   ebcdic_string = [encrypted_text].pack('H*')
#   ascii_version = ebcdic_string.encode("ASCII", "IBM037") # after some digging, found that "IBM037" is the encoding name for EBCDIC
#   ascii_version.split('').map { |char| decipher_character(char) }.join
# end

# def decipher_character(char)
#   case char
#   when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
#   else
#     char
#   end
# end

# # Finding the EBCDIC string representation to use as a test case:
# orig_encrypt = "Lhxvuveb Zngfhzbgb"
# ebcdic_encrypt = orig_encrypt.encode("IBM037") # => "\xD3\x88\xA7\xA5\xA4\xA5\x85\x82\x40\xE9\x95\x87\x86\x88\xA9\x82\x87\x82"
# hex_string = ebcdic_encrypt.unpack('H*').first # => "d388a7a5a4a5858240e995878688a9828782"

# # Test case:
# p rot13("d388a7a5a4a5858240e995878688a9828782") # => "Yukihiro Matsumoto"

# Another interesting challenge would be in writing a program that can detect different
# types of encodings and convert them to their ASCII representations appropriately.
