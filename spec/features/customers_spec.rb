require 'rails_helper'

RSpec.feature "Customer management", :type => :feature do
before(:each) do
	login_admin
end
	scenario "Admin adds customer" do

		visit new_admin_customer_path

		expect(page).to have_content("Create Customer")

		fill_in "Email", :with => "customer@example.com"
		fill_in "Battle tag", :with => "battle#1234"
		fill_in "Skype", :with => "skype.address"

		click_button("Create Customer")

		expect(Customer.count).to eq(1)

		expect(page).to have_content("customer@example.com")
		expect(page).to have_content("battle#1234")
		expect(page).to have_content("skype.address")

		# A new customer should not have an order history.
		expect(page).to_not have_content("Order History")
		

	end

	scenario "Customer with orders has order history" do
		customer = create(:customer, :with_5_completed_orders)
		visit admin_customer_path(customer)
		expect(page).to have_content("Order History")
	end
end

