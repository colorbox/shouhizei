# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shouhizei/version"

Gem::Specification.new do |spec|
  spec.name          = "shouhizei"
  spec.version       = Shouhizei::VERSION
  spec.authors       = ["colorbox"]
  spec.email         = ["colorbox222@gmail.com"]

  spec.summary       = 'This gem support to calculate Japan consumption tax'
  spec.description   = 'This gem support to calculate Japan consumption tax'
  spec.homepage      = "https://github.com/colorbox/shouhizei"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "timecop", "~> 0.9.1"

  spec.add_dependency "activesupport", ">= 5.0.0"
end
