# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ask_twitter/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'oauth'
  spec.name          = 'ask_twitter'
  spec.version       = Auto::VERSION
  spec.authors       = ['adrian.caffarelli']
  spec.email         = ['adrian.caffarelli@moove-it.com']
  spec.summary       = %q{Consult AskTwitter for timeline, trending topics, hashtags and user's bio!}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = Dir['lib/   *.rb'] + Dir['config.yml']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end