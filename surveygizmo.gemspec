# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "surveygizmo/version"

Gem::Specification.new do |s|
  s.name        = 'surveygizmo'
  s.version     = Surveygizmo::VERSION
  s.authors     = ['Bobby Uhlenbrock']
  s.email       = ['developers@helloample.com']
  s.homepage    = 'http://github.com/ample/surveygizmo'
  s.summary     = %q{A Ruby wrapper for the SurveyGizmo REST API}
  s.description = %q{A Ruby wrapper for the SurveyGizmo REST API}
  s.rubyforge_project = 'surveygizmo'
  
  # Development Gems
  # s.add_development_dependency 'rspec'
  # Gems
  s.add_dependency 'hashie', '~> 1.1.0'
  s.add_dependency 'faraday', '~> 0.7.4'
  s.add_dependency 'faraday_middleware', '~> 0.7.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
