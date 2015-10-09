require 'rails_helper'

RSpec.feature "Order management", :type => :feature do
before(:each) do
  login_admin
end

	scenario "Admin deletes order from admin/order_lines/#/edit screen" do		
    order = create(:order_line)
    visit edit_admin_order_line_path(order)
    expect(page).to have_content("Destroy")
    click_link("destroy-order-line")
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Order line was successfully destroyed.")
	end

	scenario "Visits new order line path." do
		visit new_admin_order_line_path
		expect(page).to have_content("Create New Order")
	end
end