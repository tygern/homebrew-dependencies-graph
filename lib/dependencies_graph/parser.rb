module DependenciesGraph
  class Parser
    def dependencies_to_dot(dependencies)
      dependencies.lines.flat_map do |line|
        line_to_dot(line)
      end
    end

    def line_to_dot(line)
      main, deps = line.split(":")

      dep_array = split_dependencies(deps)

      if dep_array.empty?
        ["\"#{main}\";"]
      else
        dep_array.map do |dep|
          "\"#{main}\" -> #{dep};"
        end
      end
    end

    private

    def split_dependencies(deps)
      return [] if deps.nil? || deps == "\n"

      deps.split(" ")
    end
  end
end
