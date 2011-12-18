require 'cookie_tracker/version'
require 'cookie_tracker/controller_additions'
require 'cookie_tracker/core_ext'
module CookieTracker
  @configuration = Hash.new
  
  def self.setup
    yield @configuration
  end
  
  def self.configuration
    @configuration
  end
end
