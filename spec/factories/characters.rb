FactoryGirl.define do

  factory :character do
    sequence(:spec){ |n| "spec #{n}" }
    association :classification
    association :armor_type
    association :primary_stat
    association :tier_token
  end
end