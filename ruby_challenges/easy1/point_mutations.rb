class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    test_strand = other_strand.chars[0, @strand.size]

    test_strand.select.with_index do |nuc_acid, idx|
      nuc_acid != @strand[idx]
    end.size
  end
end

# ALTERNATIVE SOLUTIONS:

# 1 - (Original Solution)
# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(other_strand)
#     test_length = [@strand.size, other_strand.size].min

#     differences = 0

#     test_length.times do |idx|
#       differences += 1 if @strand[idx] != other_strand[idx]
#     end

#     differences
#   end
# end

# 2
# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(other_strand)
#     test_length = [@strand.size, other_strand.size].min

#     (0...test_length).inject(0) do |differences, idx|
#       @strand[idx] == other_strand[idx] ? differences : differences + 1
#     end
#   end
# end
