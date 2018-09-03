module Dependencies::Brew
  class Parser
    def create_graph(dependencies)
      Dependencies::Graph::Graph.new(dependencies.lines.flat_map do |line|
        line_to_relations(line)
      end.to_set)
    end

    private

    def line_to_relations(line)
      main, deps = line.split(":")

      dep_array = split_dependencies(deps)

      result = [Dependencies::Graph::Relation.new(main)]

      unless dep_array.empty?
        dep_array.each do |dep|
          result << Dependencies::Graph::Relation.new(main, dep)
        end
      end

      result
    end

    def split_dependencies(deps)
      return [] if deps.nil? || deps == "\n"

      deps.split(" ")
    end
  end
end
