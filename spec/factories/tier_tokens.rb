FactoryGirl.define do
	factory :tier_token do
      sequence(:name) { |n| "person#{n}@example.com" }
	end
end
