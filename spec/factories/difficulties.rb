FactoryGirl.define do
	factory :difficulty do
    sequence(:name) { |n| "#{n} name" }
	end
end
