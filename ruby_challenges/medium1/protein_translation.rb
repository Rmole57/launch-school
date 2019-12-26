class InvalidCodonError < StandardError; end

class Translation
  ACIDS_CODONS = {
    'Methionine'    => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine'       => %w(UUA UUG),
    'Serine'        => %w(UCU UCC UCA UCG),
    'Tyrosine'      => %w(UAU UAC),
    'Cysteine'      => %w(UGU UGC),
    'Tryptophan'    => %w(UGG),
    'STOP'          => %w(UAA UAG UGA)
  }.freeze

  class << self
    def of_codon(codon)
      raise InvalidCodonError unless valid_codon?(codon)

      ACIDS_CODONS.select do |amino_acid, codons|
        return amino_acid if codons.include?(codon)
      end
    end

    def of_rna(strand)
      codons = strand.scan(/\w{3}/)
      amino_acids = codons.map { |codon| of_codon(codon) }
      amino_acids[0...amino_acids.index('STOP')]
    end

    private

    def valid_codon?(codon)
      ACIDS_CODONS.values.any? { |codons| codons.include?(codon) }
    end
  end
end
