# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movie-garnish/version'

Gem::Specification.new do |spec|
  spec.name          = "movie-garnish"
  spec.version       = MovieGarnish::VERSION
  spec.authors       = ["cparratto"]
  spec.email         = ["cparratto@pnmac.com"]
  spec.description   = %q{Auto tags movies with imdb meta data.}
  spec.summary       = %q{Combines the atomic-parsley-ruby api with the ruby imdb api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "imdb"
  spec.add_dependency "atomic-parsley-ruby"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
