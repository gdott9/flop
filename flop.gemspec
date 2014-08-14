# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flop/version'

Gem::Specification.new do |spec|
  spec.name          = "flop"
  spec.version       = Flop::VERSION
  spec.authors       = ["Guillaume DOTT"]
  spec.email         = ["guillaume+github@dott.fr"]
  spec.summary       = %q{A simple ruby feature flipper}
  spec.description   = %q{Activate and deactivate features easily}
  spec.homepage      = 'https://github.com/gdott9/flop'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
