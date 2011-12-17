#require '../cookie_tracker'
ActionController::Base.send :include, CookieTracker::ControllerAdditions
