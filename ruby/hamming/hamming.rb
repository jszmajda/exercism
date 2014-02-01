class Hamming
  def self.compute(a,b)
    HammingComputer.new(a,b).distance
  end

  class HammingComputer
    attr_accessor :a, :b
    def initialize(a, b)
      @a = a; @b = b
    end

    def distance
      mismatches(paired_lists).length
    end

    private

      def list(s)
        s.chars
      end

      def mismatches(pairs)
        pairs.select{|x,y| x != y}
      end

      def paired_lists
        raw_pairs = list(a).zip(list(b))
        raw_pairs.reject{|x,y| x.nil? || y.nil? }
      end
  end
end
