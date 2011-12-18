# Cookie Tracker Gem [![Build Status](https://secure.travis-ci.org/DanKnox/CookieTracker.png)](https://secure.travis-ci.org/DanKnox/CookieTracker.png)

The cookie_tracker gem allows you to declare a hash of parameters along with default values that you wish to be loaded/stored in the user's cookies during each page load. Each parameter will be loaded into it's own instance variable of the same name for easy access in controllers and views. If the parameter is passed in the params[] hash, the new value will automatically be stored in the correct cookie and replace the old or default value. This makes it easy to track various options that a user can select on a page, such as items per page, search queries, and custom display settings. If a user clicks off to another page on your site, their settings will be remembered when they return.

## Installation

**Rails 3 Only:** Add the following to your Gemfile and run the `bundle` command to install:

````ruby
gem 'cookie_tracker'
````

**Requires Ruby 1.9.2 or later.**

## Usage

This gem supplies a class method available in your controllers named `initialize_cookie_tracker`

You can place the `initialize_cookie_tracker` method inside a `before_filter` method call and pass it a hash containing the instance variables you would like set with the default values like so:

````ruby
ArticlesController < ApplicationController::Base
  before_filter :define_cookie_tracker
	
  def index
  end
	
  private
	
  def define_cookie_tracker
    initialize_cookie_tracker(:per_page => 10, :search_query => nil, :organize_by => 'author', :filter_by_month => nil)
  end
end
````

Now you will have the following instance variables and cookies available in your controller and views:

````ruby
puts @per_page
=>10
puts @search_query
=>nil
@organize_by
=>'author'
@filter_by_month
=>nil
puts cookies[:per_page]
=>10
puts cookies[:search_query]
=>nil
puts cookies[:organize_by]
=>'author'
puts cookies[:filter_by_month]
=>nil
````

CookieTracker will watch the <tt>params[]</tt> hash and update the cookies and instance variables when a parameter matching the cookie name is submitted.

````erb
Example Request:
get '/articles?per_page=15&organize_by=date'
````

Now the instance variables and cookies will be updated in your controller and views:

````ruby
@per_page == '15'
=> true
@organize_by == 'date'
=> true
cookies[:per_page] == '15'
=> true
cookies[:organize_by] == 'date'
=> true
````

You will get the most bang for your buck if you use these instance variables as the values for various configuration options in your views. Any time a user changes the option from a form or drop down menu, the cookie and instance variable will be updated accordingly:

````erb
Filter By Month: 
<%= select_tag( 'filter_by_month', options_for_select(["December","November","October"],:selected => @filter_by_month) ) %>
Search:
<%= text_field_tag  "search_query", @search_query, :placeholder => 'Search', :class => 'search-box' %>
````

Now when a user makes a change to one of these form inputs, the change will be automatically stored in their cookies and the new value will be reflected in the appropriate instance variable. Of course, these instance variables are available in your controllers for manipulation as well.

## Development

If you have any questions or find any bugs, please post them on the [issue tracker](https://github.com/DanKnox/CookieTracker/issues). Feel free to fork the project and submit any changes you can think of. The tests are developed using Test::Unit and executed by running the `bundle` and `rake` commands.

This gem is created and maintained by Dan Knox under the MIT license.
