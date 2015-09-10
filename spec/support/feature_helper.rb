# spec/support/feature_helpers.rb

include Warden::Test::Helpers

module FeatureHelpers
  def login_admin
    admin = create(:admin_user)
    login_as(admin, scope: :user)
  end

  def login_approved_user
    admin = create(:approved_user)
    login_as(admin, scope: :user)
  end

end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
  config.include FeatureHelpers, type: :request
end

RSpec.configure do |config|
  config.after :each do
    Warden.test_reset!
  end
end