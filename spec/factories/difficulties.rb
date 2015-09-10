FactoryGirl.define do
	factory :difficulty do
		factory :heroic do
			name "heroic"
			initialize_with {Difficulty.first_or_create(name: name)}
		end
	end
end
