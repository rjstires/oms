FactoryGirl.define do
	factory :play_style do
    sequence(:name) { |n| "#{n} name" }
	end
end
