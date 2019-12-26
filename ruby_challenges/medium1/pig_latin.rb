class PigLatin
  def self.translate(pig_phrase)
    pig_phrase.split.map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if start_with_vowel_sound?(word)
      word << 'ay'
    else
      consonant_sound_translation(word) << 'ay'
    end
  end

  def self.start_with_vowel_sound?(word)
    word =~ /\A[aeiou]|[xy][^aeiou]/
  end

  def self.consonant_sound_translation(word)
    word.partition(/\A[^aeiou]?qu|[^aeiou]+/).reverse.join
  end
end
