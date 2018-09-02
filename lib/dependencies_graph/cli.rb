module DependenciesGraph
  def self.run
    puts DependenciesGraph::dependencies_to_dotfile(brew_dependencies)
  end
end
