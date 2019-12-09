class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = {}
    words = @phrase.downcase.scan(/[\w']+/)

    words.each do |word|
      if word =~ /'.+'/
        word.delete_prefix!("'").delete_suffix!("'")
      end
      counts[word] = words.count(word)
    end

    counts
  end
end

# ALTERNATIVE SOLUTION:

# (using #split instead of #scan)
# class Phrase
#   def initialize(phrase)
#     @phrase = phrase
#   end

#   def word_count
#     counts = {}
#     words = @phrase.downcase.split(/[^\w']+/)

#     words.each do |word|
#       if word =~ /'.+'/
#         word.delete_prefix!("'").delete_suffix!("'")
#       end
#       counts[word] = words.count(word)
#     end
    
#     counts
#   end
# end
