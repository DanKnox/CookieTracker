$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cookie_tracker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cookie_tracker"
  s.version     = CookieTracker::VERSION
  s.authors     = ["Dan Knox"]
  s.email       = ["dknox@threedotloft.com"]
  s.homepage    = "https://github.com/DanKnox/CookieTracker"
  s.summary     = "Easily synchronizes settings stored in cookies with instance variables of the same name available for use in controllers and views."
  s.description = %q{The cookie_tracker gem allows you to declare a hash of parameters along with default values that you wish to be loaded/stored in the user's cookies during each page load. Each
    parameter will be loaded into it's own instance variable of the same name for easy access in controllers and views. If the parameter is passed in the params[] hash, the new value will automatically
    be stored in the correct cookie and replace the old or default value. This makes it easy to track various options that a user can select on a page, such as items per page, search queries, and 
    custom display settings. If a user clicks off to another page on your site, their settings will be remembered when they return. You can declare the default cookie lifetime options in an initializer
    or override them at runtime. }
    
  s.rubyforge_project = "cookie_tracker"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails" # "~> 3.0.0"

  s.add_development_dependency "rake"
  s.add_development_dependency "sqlite3"
end
