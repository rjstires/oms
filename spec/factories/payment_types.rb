FactoryGirl.define do
  factory :payment_type do
    sequence(:name) { |n| "#{n} name" }
  end
end
