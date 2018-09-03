require "dg"

module DG::Graph
  describe "graph" do
    before do
      relations = Set.new.tap do |s|
        s << Relation.new("maple")
        s << Relation.new("maple", "jupiter")
        s << Relation.new("oak")
        s << Relation.new("oak", "jupiter")
        s << Relation.new("aspen")
        s << Relation.new("elm")
        s << Relation.new("elm", "venus")
        s << Relation.new("venus")
        s << Relation.new("venus", "mercury")
      end

      @graph = Graph.new(relations)
    end

    it "finds leaves" do
      expect(@graph.leaf?(Relation.new("oak"))).to eq(true)
      expect(@graph.leaf?(Relation.new("maple"))).to eq(true)
      expect(@graph.leaf?(Relation.new("aspen"))).to eq(true)
      expect(@graph.leaf?(Relation.new("elm"))).to eq(true)
    end

    it "returns false for non-leaves" do
      expect(@graph.leaf?(Relation.new("jupiter"))).to eq(false)
      expect(@graph.leaf?(Relation.new("venus"))).to eq(false)
      expect(@graph.leaf?(Relation.new("mercury"))).to eq(false)
      expect(@graph.leaf?(Relation.new("potato"))).to eq(false)
    end

    it "returns false when a dependency is passed" do
      expect(@graph.leaf?(Relation.new("maple", "jupiter"))).to eq(false)
    end
  end
end
