# Defaults:
# :cookie_expire_date = 1.day.from_now
# :custom_domain = nil

CookieTracker.setup do |config|
  config[:cookie_expire_date] = 1.year.from_now
  config[:custom_domain]      = 'localhost'
end