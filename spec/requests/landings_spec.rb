require 'rails_helper'

RSpec.feature "Dashboard", :type => :request do
  it "should be Admin::Dashboard#index if current user is admin" do
    login_admin
    get "/"
    expect(page).to redirect_to(admin_dashboard_path)
  end

  it "should bes Dashboard#index if current user is approved" do
    login_approved_user
    get "/"
    expect(page).to redirect_to(dashboard_path)
  end

end