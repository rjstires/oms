FactoryGirl.define do
  factory :team do
    name "LA"
    name_alias "Tuna Melt"
    realm "Stormreaver"
    payment_address "paypal@example.com"
    region
    faction
    team_status
    payment_type
    user_id '1'
  end
end
