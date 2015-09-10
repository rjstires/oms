FactoryGirl.define do
	factory :primary_stat do
		factory :intellect do
			name "intellect"
			initialize_with {PrimaryStat.first_or_create(name: name)}
		end
	end
end
