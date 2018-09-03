module DG::Graph
  class Graph
    attr_reader :relations

    def initialize(relations)
      @relations = relations
    end

    def leaf?(relation)
      relation.dependency.nil? &&
          @relations.include?(relation) &&
          !dependencies.include?(relation.formula)
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

    private

    def dependencies
      @dependencies ||= @relations.map do |r|
        r.dependency
      end
    end
  end
end
