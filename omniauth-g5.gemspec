# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-g5/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-g5"
  gem.version       = OmniAuth::G5::VERSION
  gem.authors       = ["maeve"]
  gem.email         = ["maeve.revels@getg5.com"]
  gem.description   = %q{OmniAuth strategy for G5}
  gem.summary       = %q{OmniAuth strategy for G5}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('omniauth-oauth2', '~> 1.1')

  gem.add_development_dependency('rspec', '~> 2.11')
  gem.add_development_dependency('simplecov', '~> 0.7')
end
