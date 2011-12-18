module CookieTracker
  # == Description
  # The ControllerAdditions module is mixed in to ActionController::Base providing the <tt>initialize_cookie_tracker</tt> instance method for use in your controllers.
  # == Usage
  # To initialize the various cookies that you wish to track, execute the method in a before_filter call.
  #
  #   ArticlesController < ApplicationController
  #     before_filter :define_cookies_to_track
  #
  #     def index
  #     end
  #     
  #     def define_cookies_to_track
  #       initialize_cookie_tracker(:cookie_one => 'initial_value', :sort_by => 'date')
  #     end
  # 
  # This will create instance variables and cookies that match the key names from your hash. CookieTracker will track the <tt>params[]</tt> hash and these instance variables 
  # and cookies will be updated when new values are sent via the request.
  # 
  #   @cookie_one == 'initial_value'
  #   => true
  #   @sort_by == 'date'
  #   => true
  #   cookies[:cookie_one] == 'initial_value'
  #   => true
  #   cookies[:sort_by] == 'date'
  #   => true
  #
  module ControllerAdditions
    def initialize_cookie_tracker(parameters={})
      parameters.each do |setting,value|
        cookies[setting].nil? ? instance_variable_set("@#{setting}",value) : instance_variable_set("@#{setting}",cookies[setting])
        instance_variable_set("@#{setting}",params[setting].squish) unless params[setting].nil?
        cookies[setting] = instance_variable_get("@#{setting}")
      end
    end
  end
end