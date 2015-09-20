FactoryGirl.define do
  factory :payment_status do
    sequence(:name) { |n| "#{n} name" }
  end
end
