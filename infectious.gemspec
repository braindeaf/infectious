$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "infectious/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "infectious"
  s.version     = Infectious::VERSION
  s.authors     = ["Rob Lacey"]
  s.email       = ["contact@robl.me"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Infectious."
  s.description = "TODO: Description of Infectious."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta3", "< 5.1"

  s.add_development_dependency "sqlite3"
end
