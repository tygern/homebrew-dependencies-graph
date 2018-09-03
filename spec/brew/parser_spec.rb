require "dependencies"

describe "parser" do
  before do
    @parser = Dependencies::Brew::Parser.new
  end

  it "parses lines with no dependencies" do
    dependencies = "autoconf:"

    result = @parser.create_graph(dependencies)

    expect(result)
        .to eq(Dependencies::Graph::Graph.new([Dependencies::Graph::Relation.new("autoconf")].to_set))
  end

  it "parses lines with a newline" do
    dependencies = "autoconf:\n"

    result = @parser.create_graph(dependencies)

    expect(result)
        .to eq(Dependencies::Graph::Graph.new([Dependencies::Graph::Relation.new("autoconf")].to_set))
  end

  it "parses lines with one dependency" do
    dependencies = "autoconf: something"

    result = @parser.create_graph(dependencies)

    expect(result)
        .to eq(Dependencies::Graph::Graph.new([
                                                  Dependencies::Graph::Relation.new("autoconf"),
                                                  Dependencies::Graph::Relation.new("autoconf", "something")
                                              ].to_set))
  end

  it "parses lines with many" do
    dependencies = "autoconf: something another andanother"

    result = @parser.create_graph(dependencies)

    expect(result)
        .to eq(Dependencies::Graph::Graph
                   .new([
                            Dependencies::Graph::Relation.new("autoconf"),
                            Dependencies::Graph::Relation.new("autoconf", "something"),
                            Dependencies::Graph::Relation.new("autoconf", "another"),
                            Dependencies::Graph::Relation.new("autoconf", "andanother"),
                        ].to_set))
  end

  it "handles multiple lines" do
    dependencies = <<-DEP
autoconf: something another andanother
turtle: chicken
    DEP

    result = @parser.create_graph(dependencies)

    expect(result)
        .to eq(Dependencies::Graph::Graph
                   .new([
                            Dependencies::Graph::Relation.new("autoconf"),
                            Dependencies::Graph::Relation.new("autoconf", "something"),
                            Dependencies::Graph::Relation.new("autoconf", "another"),
                            Dependencies::Graph::Relation.new("autoconf", "andanother"),
                            Dependencies::Graph::Relation.new("turtle"),
                            Dependencies::Graph::Relation.new("turtle", "chicken"),
                        ].to_set))
  end
end
