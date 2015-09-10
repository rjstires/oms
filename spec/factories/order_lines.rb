# spec/factories/order_lines.rb
FactoryGirl.define do

	# Default order_line is effecivly a lead.
	factory :order_line do
    sale "9999.99"
    merchant_fee "300.00"
    site_fee "1939.99"
    contractor_payment "7760.00"
    customer
		product
		character
		region
		faction
    
		team_paid false
		order_paid false
	end

  # Ready to dispatch
  trait :read_to_dispatch do
  	order_paid true
  end

  # Scheduled
  trait :scheduled do
  	scheduled_at DateTime.now + 1.week
  	team
  end

 # Service Complete
  trait :team_pending_payment do
  	completed_at DateTime.now
  	team_paid false
  	order_paid true
  end

 # Order Complete
  trait :completed do
  	completed_at DateTime.now
  	order_paid true
  	team_paid true
  end

end
