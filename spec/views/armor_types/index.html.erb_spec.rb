require 'rails_helper'

RSpec.describe "armor_types/index", type: :view do
  before(:each) do
    assign(:armor_types, [
      ArmorType.create!(
        :name => "Name"
      ),
      ArmorType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of armor_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
