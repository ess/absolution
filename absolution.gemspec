$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "absolution/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "absolution"
  s.version     = Absolution::VERSION
  s.authors     = ["Dennis Walters"]
  s.email       = ["dennis@elevatorup.com"]
  s.homepage    = "http://github.com/ess/absolution"
  s.summary     = "Absolute URL detection and construction"
  s.description = "Absolute URL detection and construction"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.md"]

  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rspec"
end
