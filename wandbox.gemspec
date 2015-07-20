# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wandbox/version'

Gem::Specification.new do |spec|
  spec.name          = "wandbox"
  spec.version       = Wandbox::VERSION
  spec.authors       = ["manga_osyo"]
  spec.email         = ["manga.osyo@gmail.com"]

  spec.summary       = %q{Wandbox(http://melpon.org/wandbox/) in CLI.}
  spec.description   = %q{Wandbox(http://melpon.org/wandbox/) in CLI.}
  spec.homepage      = "https://github.com/osyo-manga/gem-wandbox"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "0.19.1"
  spec.add_dependency "iolite", "0.0.3"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
