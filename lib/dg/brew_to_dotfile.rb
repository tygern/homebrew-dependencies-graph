module DG
  def self.brew_to_dotfile(dependencies)
    graph = Brew::Parser.new.create_graph(dependencies)

    Dot::format(graph)
  end
end
