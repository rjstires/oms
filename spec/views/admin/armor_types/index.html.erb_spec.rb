require 'rails_helper'

RSpec.describe "admin/armor_types/index", type: :view do
  before(:each) do
    assign(:admin_armor_types, [
      Admin::ArmorType.create!(
        :name => "Name"
      ),
      Admin::ArmorType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin/armor_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
