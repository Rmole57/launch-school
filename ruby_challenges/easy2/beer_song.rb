class BeerSong
  def verse(num)
    case num
    when (3..99)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      raise ArgumentError, 'Input number must be between 0 and 99!'
    end
  end

  def verses(first, last)
    first.downto(last).map { |bottles| verse(bottles) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

# BONUS SOLUTION - No conditionals:

# class BeerSong
#   def initialize
#     @verse_types = setup_verse_types
#   end

#   def verse(num)
#     @verse_types[num].verse(num)
#   end

#   def verses(first, last)
#     first.downto(last).map { |bottles| verse(bottles) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end

#   private

#   def setup_verse_types
#     verse_types = Hash.new(Verse.new)

#     variant_verses = {
#       0 => NoBottlesVerse.new,
#       1 => OneBottleVerse.new,
#       2 => TwoBottlesVerse.new
#     }

#     verse_types.merge(variant_verses)
#   end
# end

# class Verse
#   def verse(num)
#     "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
#     "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
#   end
# end

# class TwoBottlesVerse < Verse
#   def verse(_)
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#     "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end
# end

# class OneBottleVerse < Verse
#   def verse(_)
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#     "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end
# end

# class NoBottlesVerse < Verse
#   def verse(_)
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#     "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end

# ALTERNATIVE BONUS SOLUTION:

# (an interesting solution from a classmate)
# class BeerSong
#   def verse(number)
#     begin
#       verse_class = Module.const_get("Verse#{number}")
#     rescue NameError
#       verse_class = Verse
#     end

#     verse_class.new(number).verse
#   end

#   def verses(first, last)
#     first.downto(last).to_a.map { |number| verse(number) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

# class Verse
#   def initialize(number)
#     @number = number
#   end

#   def verse
#     "#{@number} bottles of beer on the wall, #{@number} bottles of beer.\n" \
#     "Take one down and pass it around, #{@number - 1} bottles of beer " \
#     "on the wall.\n"
#   end
# end

# class Verse0 < Verse
#   def verse
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#     "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end

# class Verse1 < Verse
#   def verse
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#     "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end
# end

# class Verse2 < Verse
#   def verse
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#     "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end
# end
