FactoryGirl.define do
	factory :classification do
		factory :priest do
			name "priest"
			initialize_with {Classification.first_or_create(name: name)}
		end
	end
end
