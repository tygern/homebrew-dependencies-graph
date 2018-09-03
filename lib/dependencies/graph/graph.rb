module Dependencies::Graph
  class Graph
    attr_reader :relations

    def initialize(relations)
      @relations = relations
    end

    def hash
      @relations.hash
    end

    def ==(other)
      self.hash == other.hash
    end

    def eql?(other)
      self == other
    end
  end
end
