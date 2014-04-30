# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redpygments/version'

Gem::Specification.new do |spec|
  spec.name          = "redpygments"
  spec.version       = Redpygments::VERSION
  spec.authors       = ["boxnos"]
  spec.email         = ["boxnos@yahoo.com"]
  spec.summary       = %q{Awsome markdown tool.}
  spec.description   = %q{Awsome markdown tool.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'redcarpet'
  spec.add_dependency 'pygments.rb'
  spec.add_dependency 'slim'
  spec.add_dependency 'sass'
end
