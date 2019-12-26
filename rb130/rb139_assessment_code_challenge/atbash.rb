class Atbash
  FIRST_13 = %w(a b c d e f g h i j k l m)
  LAST_13 = %w(z y x w v u t s r q p o n)

  class << self
    def encode(str)
      input_chars = str.split.join.downcase.chars
      enc_letters = input_chars.map { |letter| decode_letter(letter) }.compact
      enc_words = enc_letters.join.scan(/[\w\d]{1,5}/)
      enc_words.join(' ')
    end

    def decode_letter(char)
      if FIRST_13.include?(char)
        LAST_13[FIRST_13.index(char)]
      elsif LAST_13.include?(char)
        FIRST_13[LAST_13.index(char)]
      elsif char =~ /\d/
        char
      end
    end
  end
end
