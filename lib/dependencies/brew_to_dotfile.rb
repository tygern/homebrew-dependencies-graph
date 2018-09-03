module Dependencies
  def self.brew_to_dotfile(dependencies)
    graph = Dependencies::Brew::Parser.new.create_graph(dependencies)

    Dependencies::Dot::format(graph)
  end
end
