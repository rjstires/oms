FactoryGirl.define do
  factory :team do
    sequence(:name){|n| "team #{n}"}
    sequence(:name_alias){|n| "team #{n} alias"}
    sequence(:payment_address){|n| "team_#{n}@paypal.com"}
    realm "realm"
    region
    faction
    team_status
    payment_type
  end
end
