# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_boilerplate/version"

Gem::Specification.new do |s|
  s.name        = "rails-boilerplate"
  s.version     = RailsBoilerplate::VERSION
  s.authors     = ["Christiaan Van den Poel"]
  s.email       = ["christiaan.vandenpoel@gmail.com"]
  s.homepage    = "http://github.com/khelben/rails-boilerplate"
  s.summary     = %q{HTML5 boilerplate for Rails (>= 3.1)}
  s.description = %q{HTML5 boilerplate for Rails (>= 3.1)}

  s.rubyforge_project = "rails-boilerplate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
