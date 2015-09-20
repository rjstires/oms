FactoryGirl.define do
	factory :faction do
    sequence(:name) { |n| "#{n} name" }
	end
end
