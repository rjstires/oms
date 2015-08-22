require 'rails_helper'

RSpec.describe "armor_types/show", type: :view do
  before(:each) do
    @armor_type = assign(:armor_type, ArmorType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
