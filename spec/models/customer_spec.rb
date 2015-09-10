require 'rails_helper'

RSpec.describe Customer, type: :model do
	context "with valid information" do
		
		it "has valid factory" do
			customer = build(:customer)
			expect(customer).to be_valid	
		end

	end

end
