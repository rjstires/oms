# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:scheduled_for] = "%B %d %Y at %H:%M"