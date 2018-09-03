module Dependencies::Graph
  class Relation
    attr_reader :formula, :dependency

    def initialize(formula, dependency = nil)
      @formula = formula
      @dependency = dependency
    end

    def hash
      [@formula, @dependency].hash
    end

    def ==(other)
      self.hash == other.hash
    end

    def eql?(other)
      self == other
    end
  end
end
