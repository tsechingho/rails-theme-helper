# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-theme-helper/version'

Gem::Specification.new do |gem|
  gem.name          = 'rails-theme-helper'
  gem.version       = RailsThemeHelper::VERSION
  gem.authors       = ['Tse-Ching Ho']
  gem.email         = ['tsechingho@gmail.com']
  gem.description   = %q{This gem helps you build themes for rails}
  gem.summary       = %q{helps you build themes for rails}
  gem.homepage      = 'https://github.com/tsechingho/rails-theme-helper'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'railties', '>= 3.1.1'
end
