require 'rails_helper'

describe "user registration" do
  it "allows new users to register with an email address and password" do
    visit new_user_registration_url

    fill_in "Name", :with => "Joe Brown"
    fill_in "Email", :with => "user@example.com"
    fill_in "Battle tag", :with => "battle#1234"
    fill_in "Skype", :with => "skype.address"
    fill_in "Password", :with => "password1234"
    fill_in "Password confirmation", :with => "password1234"

    click_button "Sign up"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end