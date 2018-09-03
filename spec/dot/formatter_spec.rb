require "dependencies"

describe "formatter" do
  it "formats a dotfile" do
    graph = Dependencies::Graph::Graph
                .new([
                         Dependencies::Graph::Relation.new("autoconf", "something"),
                         Dependencies::Graph::Relation.new("autoconf", "another"),
                         Dependencies::Graph::Relation.new("turtle"),
                     ].to_set)

    expected_result = <<-EXP
digraph D {
    "autoconf" -> something;
    "autoconf" -> another;
    "turtle";
}
    EXP

    result = Dependencies::Dot::format(graph)

    expect(result).to eq(expected_result)
  end
end
