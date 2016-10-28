$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "infectious/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "infectious"
  s.version     = Infectious::VERSION
  s.authors     = ["Rob Lacey"]
  s.email       = ["contact@robl.me"]
  s.homepage    = "http://robl.me/gems/infectious"
  s.summary     = "Authorizations Engine"
  s.description = "Rails Engine for linking Social Network / Third-Party (O)Authorizations"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0", "< 5.1"
  s.add_dependency 'simple_form'

  s.add_development_dependency "sqlite3"
end
