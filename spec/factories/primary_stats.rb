FactoryGirl.define do
	factory :primary_stat do
    sequence(:name) { |n| "#{n} name" }
	end
end
