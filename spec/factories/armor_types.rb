FactoryGirl.define do
	factory :armor_type do
		factory :cloth do
			name "cloth"
			initialize_with {ArmorType.first_or_create(name: name)}
		end
	end
end
