# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'japi/version'

Gem::Specification.new do |spec|
  spec.name                  = "japi"
  spec.version               = JAPI::VERSION
  spec.authors               = ["Dean Silfen"]
  spec.email                 = ["dean.silfen@gmail.com"]

  spec.summary               = %q{A simple object wrapper for the jservice.io API.}
  spec.description           = %q{A simple object wrapper for the jservice.io API.}
  spec.homepage              = "http://jeopardean.com"
  spec.license               = "MIT"
  spec.required_ruby_version = '>= 1.9.3'

  spec.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir                = "exe"
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ["lib"]

  spec.add_runtime_dependency 'configurations', '~> 2.2.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"
end
