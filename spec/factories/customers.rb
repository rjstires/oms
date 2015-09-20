# spec/factories/custmers.rb
FactoryGirl.define do

  factory :customer do

    sequence(:email) { |n| "user_#{n}@example.com" }
    sequence(:battle_tag) { |n| "#{n} name" }
    sequence(:skype) { |n| "#{n} name" }

		trait :with_5_completed_orders do
			after :create do |customer|
				create_list(:order_line, 5, :completed, :customer => customer)				
			end
		end
  end
end