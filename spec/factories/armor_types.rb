FactoryGirl.define do
	factory :armor_type do
    sequence(:name) { |n| "person#{n}@example.com" }
	end
end
