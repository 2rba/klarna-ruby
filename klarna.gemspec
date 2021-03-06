# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'klarna/version'

Gem::Specification.new do |s|
  s.name        = "klarna-xmlrpc"
  s.version     = Klarna::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonas Grimfelt","Serg Tyatin"]
  s.email       = ["jonas@merchii.com"]
  s.homepage    = "http://github.com/2rba/klarna-ruby"
  s.summary     = %{A Ruby wrapper for Klarna/Kreditor XML-RPC API.}
  s.description = s.summary

  s.add_dependency 'activesupport'
  s.add_dependency 'i18n'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-minitest'
  s.add_development_dependency 'sinatra'
  s.add_development_dependency 'sinatra-mapping'
  s.add_development_dependency 'haml'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end