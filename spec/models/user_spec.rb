require "rails_helper"

RSpec.describe User, :type => :model do
	it "has valid user factory" do
		user = create(:user)
		expect(user).to be_valid
	end

	it "has valid approved_user factory" do
		approved_user = create(:approved_user)
		expect(approved_user).to be_valid
	end

	it "has valid admin_user factory" do
		admin_user = create(:admin_user)
		expect(admin_user).to be_valid
	end
	
end