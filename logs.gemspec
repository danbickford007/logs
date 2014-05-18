$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "logs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "logs"
  s.version     = Logs::VERSION
  s.authors     = ["Dan Bickford"]
  s.email       = ["danbickford007@yahoo.com"]
  s.homepage    = ""
  s.summary     = "Summary of Logs."
  s.description = "Description of Logs."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "bootstrap-rails-engine"
  s.add_dependency "haml-rails"
  s.add_dependency "therubyracer"
  s.add_dependency "less-rails"
  s.add_dependency "kaminari"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "kaminari"
  s.add_development_dependency "html2haml"
  s.add_development_dependency "bootstrap-rails-engine"
  s.add_development_dependency "haml-rails"
  s.add_development_dependency "therubyracer"
  s.add_development_dependency "less-rails"
end
