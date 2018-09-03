module Dependencies
  module Brew
  end
  module Dot
  end
  module Graph
  end
end

require "dependencies/cli"
require "dependencies/brew_to_dotfile"

require "dependencies/brew/dependencies"
require "dependencies/brew/parser"

require "dependencies/graph/graph"
require "dependencies/graph/relation"

require "dependencies/dot/formatter"
