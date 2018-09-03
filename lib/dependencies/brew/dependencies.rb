module Dependencies::Brew
  def self.dependencies
    `brew deps --installed`
  end
end
