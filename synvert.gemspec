# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'synvert/version'

Gem::Specification.new do |spec|
  spec.name          = "synvert"
  spec.version       = Synvert::VERSION
  spec.authors       = ["Richard Huang"]
  spec.email         = ["flyerhzm@gmail.com"]
  spec.description   = %q{synvert is used to convert ruby code to better syntax.}
  spec.summary       = %q{synvert = syntax + convert.}
  spec.homepage      = "https://github.com/xinminlabs/synvert"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "synvert-core"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakefs"
end
