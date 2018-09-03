module Dependencies::Dot

  def self.format(graph)
    "digraph D {\n".tap do |result|
      graph.relations.each do |relation|
        result << format_relation(relation)
      end
    end + "}\n"
  end

  private

  def self.format_relation(relation)
    if relation.dependency.nil?
      "    \"#{relation.formula}\";\n"
    else
      "    \"#{relation.formula}\" -> \"#{relation.dependency}\";\n"
    end
  end
end
