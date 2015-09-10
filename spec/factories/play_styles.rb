FactoryGirl.define do
	factory :play_style do
		factory :self_play do
			name "self play"
			initialize_with {PlayStyle.first_or_create(name: name)}
		end
	end
end
