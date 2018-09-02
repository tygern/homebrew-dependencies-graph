require "dependencies_graph"

describe "parser" do
  before do
    @parser = DependenciesGraph::Parser.new
  end

  describe "line_to_dot" do

    it "parses lines with no dependencies" do
      line = "autoconf:"

      result = @parser.line_to_dot(line)

      expect(result).to eq(["\"autoconf\";"])
    end

    it "parses lines with no dependencies and a newline" do
      line = "autoconf:\n"

      result = @parser.line_to_dot(line)

      expect(result).to eq(["\"autoconf\";"])
    end

    it "parses lines with one dependency" do
      line = "autoconf: something"

      result = @parser.line_to_dot(line)

      expect(result).to eq(["\"autoconf\" -> something;"])
    end

    it "parses lines with many" do
      line = "autoconf: something another andanother"

      expected_result = [
          "\"autoconf\" -> something;",
          "\"autoconf\" -> another;",
          "\"autoconf\" -> andanother;"
      ]

      result = @parser.line_to_dot(line)

      expect(result).to eq(expected_result)
    end
  end

  describe "dependencies_to_dot" do
    it "parses dependencies" do
      dependencies = <<-DEPS
autoconf:
automake: autoconf
bison:
gd: fontconfig freetype jpeg
      DEPS

      expected_result = [
          "\"autoconf\";",
          "\"automake\" -> autoconf;",
          "\"bison\";",
          "\"gd\" -> fontconfig;",
          "\"gd\" -> freetype;",
          "\"gd\" -> jpeg;"
      ]


      result = @parser.dependencies_to_dot(dependencies)

      expect(result).to eq(expected_result)
    end
  end
end
