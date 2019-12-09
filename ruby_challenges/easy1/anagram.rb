class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select do |candidate|
      same_letters?(word, candidate) && different_word?(word, candidate)
    end
  end

  private

  attr_reader :word

  def same_letters?(str1, str2)
    letters1 = str1.downcase.chars
    letters2 = str2.downcase.chars

    letters1.permutation.any? { |perm| perm == letters2 }
  end

  def different_word?(str1, str2)
    str1 !~ /\b#{str2}\b/i
  end
end

# ALTERNATIVE SOLUTIONS:

# 1 - (original solution; with #sort method)
# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(candidates)
#     candidates.select do |candidate|
#       same_letters?(word, candidate) && different_word?(word, candidate)
#     end
#   end

#   private

#   attr_reader :word

#   def sorted_letters(str)
#     str.downcase.chars.sort
#   end

#   def same_letters?(str1, str2)
#     sorted_letters(str1) == sorted_letters(str2)
#   end

#   def different_word?(str1, str2)
#     str1 !~ /\b#{str2}\b/i
#   end
# end

# 2 - (without #sort method)
# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(candidates)
#     candidates.select do |candidate|
#       same_letters?(word, candidate) && different_word?(word, candidate)
#     end
#   end

#   private

#   attr_reader :word

#   def same_letter_counts?(str1, str2)
#     letters1 = str1.downcase.chars
#     letters2 = str2.downcase.chars

#     letters2.all? do |letter|
#       letters1.count(letter) == letters2.count(letter)
#     end
#   end

#   def same_length?(str1, str2)
#     str1.size == str2.size
#   end

#   def same_letters?(str1, str2)
#     same_letter_counts?(str1, str2) && same_length?(str1, str2)
#   end

#   def different_word?(str1, str2)
#     str1 !~ /\b#{str2}\b/i
#   end
# end
