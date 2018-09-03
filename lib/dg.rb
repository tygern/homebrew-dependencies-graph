module DG
  module Brew
  end
  module Dot
  end
  module Graph
  end
end

require "dg/cli"
require "dg/brew_to_dotfile"

require "dg/brew/dependencies"
require "dg/brew/parser"

require "dg/graph/graph"
require "dg/graph/relation"

require "dg/dot/formatter"
