FactoryGirl.define do
	factory :category do
		factory :raiding do
			name "raiding"
			initialize_with {Category.first_or_create(name: name)}
		end
	end
end
