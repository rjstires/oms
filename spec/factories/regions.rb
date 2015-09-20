FactoryGirl.define do
  factory :region do
  	sequence(:name) { |n| "#{n} name" }
  end
end
