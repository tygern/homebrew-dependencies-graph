module DG
  class Cli
    def self.run
      puts DG::brew_to_dotfile(Brew::dependencies)
    end
  end
end
