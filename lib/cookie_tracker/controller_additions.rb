module CookieTracker
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