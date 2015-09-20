FactoryGirl.define do
  factory :team_status do
    sequence(:name) { |n| "#{n} name" }
  end
end
