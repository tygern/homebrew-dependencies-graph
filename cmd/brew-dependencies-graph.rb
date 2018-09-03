BREW_GEM_HOME = File.expand_path("../..", __FILE__)

$LOAD_PATH.unshift(File.join(BREW_GEM_HOME, "lib"))

require "dependencies"

Dependencies::run
