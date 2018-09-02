module DependenciesGraph
  def self.brew_dependencies
    `brew deps --installed`
  end
end
