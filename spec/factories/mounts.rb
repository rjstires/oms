FactoryGirl.define do
	factory :mount do
    sequence(:name) { |n| "#{n} name" }
	end
end
