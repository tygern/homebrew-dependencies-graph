module DependenciesGraph
  def self.dependencies_to_dotfile(dependencies)
    parser = Parser.new

    dot_lines = parser.dependencies_to_dot(dependencies)

    format_dotfile(dot_lines)
  end

  private

  def self.format_dotfile(lines)
    "digraph D {\n    #{lines.join("\n    ")}\n}\n"
  end
end
