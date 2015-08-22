require 'rails_helper'

RSpec.describe "admin/armor_types/edit", type: :view do
  before(:each) do
    @admin_armor_type = assign(:admin_armor_type, Admin::ArmorType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit admin_armor_type form" do
    render

    assert_select "form[action=?][method=?]", admin_armor_type_path(@admin_armor_type), "post" do

      assert_select "input#admin_armor_type_name[name=?]", "admin_armor_type[name]"
    end
  end
end
