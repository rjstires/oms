FactoryGirl.define do
	factory :mount do
		factory :no_mount do
			name "no mount"
			initialize_with {Mount.first_or_create(name: name)}
		end
	end
end
