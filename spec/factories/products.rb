# spec/factories/products.rb
FactoryGirl.define do
	sequence(:description) { |n| "Item ##{n}" }

  factory :product do |f|
  	description :description
  	association :category, factory: :raiding
    association :zone, factory: :hellfire_citadel
    association :difficulty, factory: :heroic
    association :play_style, factory: :self_play
    association :loot_option, factory: :master_loot
  	association :mount, factory: :no_mount
  end
end