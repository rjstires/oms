FactoryGirl.define do
	factory :loot_option do
		factory :master_loot do
			name "master loot"
			initialize_with {LootOption.first_or_create(name: name)}
		end
	end
end
