FactoryGirl.define do
	factory :zone do
    sequence(:name) { |n| "person#{n}@example.com" }
	end
end
