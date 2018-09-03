require "dg"

describe "formatter" do
  it "formats a dotfile" do
    graph = DG::Graph::Graph
                .new([
                         DG::Graph::Relation.new("autoconf", "something"),
                         DG::Graph::Relation.new("autoconf", "another"),
                         DG::Graph::Relation.new("turtle"),
                     ].to_set)

    expected_result = <<-EXP
digraph D {
    "autoconf" -> "something";
    "autoconf" -> "another";
    "turtle" [fontcolor=white,style=filled,color=darkslategray];
}
    EXP

    result = DG::Dot::format(graph)

    expect(result).to eq(expected_result)
  end
end
