FactoryGirl.define do
	factory :classification do
    sequence(:name) { |n| "#{n} name" }
	end
end
