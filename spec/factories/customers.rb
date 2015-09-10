# spec/factories/custmers.rb
FactoryGirl.define do

  factory :customer do

  	email "user@example.com"
  	battle_tag "battle#1234"
  	skype "skype.address123"

		trait :with_5_completed_orders do
			after :create do |customer|
				create_list(:order_line, 5, :completed, :customer => customer)				
			end
		end
  end
end