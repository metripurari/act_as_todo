# -*- encoding: utf-8 -*-
require File.expand_path('../lib/act_as_todo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tripurari"]
  gem.email         = ["tsingh.sharan@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "act_as_todo"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

end
