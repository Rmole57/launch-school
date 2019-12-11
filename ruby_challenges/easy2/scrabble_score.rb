class Scrabble
  LETTER_VALUES = {
    /[AEIOULNRST]/i => 1,
    /[DG]/i         => 2,
    /[BCMP]/i       => 3,
    /[FHVWY]/i      => 4,
    /K/i            => 5,
    /[JX]/i         => 8,
    /[QZ]/i         => 10
  }.freeze

  def initialize(word)
    @letters = word.to_s.chars
  end

  def self.score(word)
    new(word).score
  end

  def score
    @letters.reduce(0) do |sum, letter|
      letter_score = 0

      LETTER_VALUES.each do |letter_set, letter_val|
        if letter =~ letter_set
          letter_score = letter_val
          break
        end
      end

      sum + letter_score
    end
  end
end

# ALTERNATIVE SOLUTIONS:

# 1)
# class Scrabble
#   LETTER_VALUES = {
#     /[AEIOULNRST]/i => 1,
#     /[DG]/i         => 2,
#     /[BCMP]/i       => 3,
#     /[FHVWY]/i      => 4,
#     /K/i            => 5,
#     /[JX]/i         => 8,
#     /[QZ]/i         => 10
#   }.freeze

#   def initialize(word)
#     @letters = word.to_s.chars
#   end

#   def self.score(word)
#     new(word).score
#   end

#   def score
#     word_score = 0

#     @letters.each do |letter|
#       LETTER_VALUES.each do |letter_set, letter_val|
#         word_score += letter_val if letter =~ letter_set
#       end
#     end

#     word_score
#   end
# end

# 2) - (interesting solution from a classmate)
# class Scrabble
#   def initialize(word)
#     @letters = word.to_s.downcase.chars
#   end

#   def self.score(word)
#     new(word).score
#   end

#   def score
#     @letters.reduce(0) { |sum, letter| sum + point_conversion(letter) }
#   end

#   private

#   def point_conversion(letter)
#     case letter
#     when 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' then 1
#     when 'd', 'g'                                         then 2
#     when 'b', 'c', 'm', 'p'                               then 3
#     when 'f', 'h', 'v', 'w', 'y'                          then 4
#     when 'k'                                              then 5
#     when 'j', 'x'                                         then 8
#     when 'q', 'z'                                         then 10
#     else                                                       0
#     end
#   end
# end
