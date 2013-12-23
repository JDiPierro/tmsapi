# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tmsapi/version'

Gem::Specification.new do |gem|
  gem.name          = 'tmsapi'
  gem.version       = TMSAPI::VERSION
  gem.authors       = ['Justin DiPierro']
  gem.email         = ['jdipierro@tribune.com']
  gem.description   = %q{A Ruby gem for the TMS API}
  gem.summary       = %q{This gem wraps the TMS API documented at https://developer.tmsapi.com}
  gem.homepage      = 'https://github.com/jdipierro/tmsapi'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  if RUBY_PLATFORM == 'java'
    gem.add_runtime_dependency 'jruby-openssl'
  end

  gem.add_dependency 'faraday', '~> 0.8.7'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_dependency 'json', '~> 1.8.1'
  gem.add_dependency 'rash', '~> 0.4.0'
  gem.add_dependency 'virtus', '~> 1.0.1'

  gem.add_development_dependency 'rspec', '~> 2.0'

  if RUBY_PLATFORM =~ /darwin/i
    gem.add_development_dependency 'rb-fsevent', '~> 0.9.3'
  end

  gem.add_development_dependency 'vcr',     '~> 2.4'
  gem.add_development_dependency 'fakeweb', '~> 1.3.0'
  gem.add_development_dependency 'rake',  '~> 10.1.0'
  gem.add_development_dependency 'coveralls', '~> 0.7.0'
  gem.add_development_dependency 'factory_girl', '~> 4.0'
end