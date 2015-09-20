FactoryGirl.define do
	factory :category do
    sequence(:name) { |n| "person#{n}@example.com" }
	end
end
