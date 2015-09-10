FactoryGirl.define do
	factory :zone do
		factory :hellfire_citadel do
			name "hellfire citadel"
			initialize_with {Zone.first_or_create(name: name)}
		end
	end
end
