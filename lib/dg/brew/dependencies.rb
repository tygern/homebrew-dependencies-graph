module DG::Brew
  def self.dependencies
    `brew deps --installed`
  end
end
