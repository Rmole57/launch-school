class TextAnalyzer
  def process
    if block_given?
      File.open('sample_text.txt') { |file| yield(file.read) }
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(' ').size} words" }

# ALTERNATIVE SOLUTIONS:

# 1)
# class TextAnalyzer
#   def process
#     file = File.open('sample_text.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }

# 2)
# class TextAnalyzer
#   def process
#     yield(File.read('sample_text.txt')) if block_given?
#   end
# end
