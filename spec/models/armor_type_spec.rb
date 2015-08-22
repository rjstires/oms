require 'rails_helper'

RSpec.describe ArmorType, type: :model do

  it "has a valid factory" do
  	armor_type = create(:armor_type)
  	
  	expect(armor_type).to be_valid
  end

  it "is invalid without a name" do
  		armor_type = build(:armor_type, name: nil)

  		expect(armor_type).to_not be_valid
  end

  it "should be unique" do
  	armor_type = create(:armor_type, name: 'cloth')
  	duplicate_armor_type = build(:armor_type, name: 'cloth')

  	expect(duplicate_armor_type).to_not be_valid
  end
end
