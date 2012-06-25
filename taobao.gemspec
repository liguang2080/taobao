# -*- encoding: utf-8 -*-
require File.expand_path('../lib/taobao/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["liguang"]
  gem.email         = ["lg2046@gmail.com"]
  gem.description   = %q{Taobao open sdk}
  gem.summary       = %q{Taobao open sdk}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "taobao"
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'rack'
  
  gem.version       = Taobao::VERSION
end
