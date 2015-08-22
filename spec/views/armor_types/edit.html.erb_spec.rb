require 'rails_helper'

RSpec.describe "armor_types/edit", type: :view do
  before(:each) do
    @armor_type = assign(:armor_type, ArmorType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit armor_type form" do
    render

    assert_select "form[action=?][method=?]", armor_type_path(@armor_type), "post" do

      assert_select "input#armor_type_name[name=?]", "armor_type[name]"
    end
  end
end
