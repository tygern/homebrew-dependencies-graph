module DG::Dot

  def self.format(graph)
    "digraph D {\n".tap do |result|
      graph.relations.each do |relation|
        result << format_relation(relation, graph)
      end
    end + "}\n"
  end

  private

  def self.format_relation(relation, graph)
    if graph.leaf?(relation)
      "    \"#{relation.formula}\" [fontcolor=white,style=filled,color=darkslategray];\n"
    elsif relation.dependency.nil?
      "    \"#{relation.formula}\";\n"
    else
      "    \"#{relation.formula}\" -> \"#{relation.dependency}\";\n"
    end
  end
end
