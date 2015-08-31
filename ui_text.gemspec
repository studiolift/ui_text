$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ui_text/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ui_text"
  s.version     = UiText::VERSION
  s.authors     = ["Kris Handley"]
  s.email       = ["handley.kris@gmail.com"]
  s.homepage    = ""
  s.summary     = "Editable locale text"
  s.description = "Editable locale text"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "database_cleaner"
end
