# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kuby/version'

Gem::Specification.new do |gem|
  gem.name          = "kuby"
  gem.version       = Kuby::VERSION
  gem.authors       = ["Ralph Rooding"]
  gem.email         = ["ralph@izerion.com"]
  gem.description   = %q{Crash your Kerbals using Ruby!}
  gem.summary       = %q{Crash your Kerbals using Ruby!}
  gem.homepage      = "https://github.com/rrooding/kuby"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'excon'
  gem.add_dependency 'multi_json'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'webmock'
end
