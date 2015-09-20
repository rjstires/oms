# spec/factories/products.rb
FactoryGirl.define do
	sequence(:description) { |n| "Item ##{n}" }

  factory :product do |f|
  	description :description
  	association :category
    association :zone
    association :difficulty
    association :play_style
    association :loot_option
  	association :mount
  end
end