module Dependencies
  def self.run
    puts Dependencies::brew_to_dotfile(::Brew::dependencies)
  end
end
