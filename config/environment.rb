# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:datetime] = "%b %d, %Y at %l:%M %p"
Time::DATE_FORMATS[:short_date] = "%m/%d/%Y"
Time::DATE_FORMATS[:long_datetime] = "%A, %B %e %Y at %H:%M EST"
