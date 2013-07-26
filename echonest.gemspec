# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'echonest/version'

Gem::Specification.new do |gem|
  gem.name          = "echonest"
  gem.version       = Echonest::Version
  gem.authors       = ["Tim Case"]
  gem.email         = ["tim@2drops.net"]
  gem.description   = %q{A Ruby interface to the Echonest API.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/timcase/echonest"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday', '~> 0.9.0.rc5'
  gem.add_dependency 'multi_json', '~> 1.7.7'
  gem.add_dependency 'simple_oauth', '~> 0.2'

end
