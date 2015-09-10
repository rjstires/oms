FactoryGirl.define do

  factory :character do
    spec { "shadow" }
    association :classification, factory: :priest
    association :armor_type, factory: :cloth
    association :primary_stat, factory: :intellect
    association :tier_token, factory: :conqueror
    
    initialize_with {
    	Character.first_or_create(
				spec: spec,
				classification: classification,
				armor_type: armor_type,
				primary_stat: primary_stat,
				tier_token: tier_token)
		}
  end
end