FactoryGirl.define do
	factory :loot_option do
    sequence(:name) { |n| "#{n} name" }
	end
end
