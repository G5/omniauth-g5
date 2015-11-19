# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-g5/version'

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-g5'
  gem.version       = OmniAuth::G5::VERSION
  gem.authors       = ['Maeve Revels', 'Rob Revels']
  gem.email         = ['maeve.revels@getg5.com', 'rob.revels@getg5.com']
  gem.description   = 'OmniAuth strategy for G5'
  gem.summary       = 'OmniAuth strategy for G5'
  gem.homepage      = 'https://github.com/G5/omniauth-g5'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # Pinning version to 1.3.1 since 1.4.0 removes the `callback_url` method required for our oauth workflow
  gem.add_dependency('omniauth-oauth2', '= 1.3.1')

  gem.add_development_dependency('rspec', '~> 3.2')
  gem.add_development_dependency('rspec-its')
  gem.add_development_dependency('simplecov', '~> 0.7')
  gem.add_development_dependency('codeclimate-test-reporter')
  gem.add_development_dependency('pry')
  gem.add_development_dependency('webmock')
end
