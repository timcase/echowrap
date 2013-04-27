# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'echonest/version'

Gem::Specification.new do |gem|
  gem.name          = "echonest"
  gem.version       = Echonest::VERSION
  gem.authors       = ["Tim Case"]
  gem.email         = ["tim@2drops.net"]
  gem.description   = %q{A Ruby interface to the Echonest API.}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
