FactoryGirl.define do
	factory :tier_token do
		factory :conqueror do
			name "conqueror"
			initialize_with {TierToken.first_or_create(name: name)}
		end
	end
end
