require 'rails_helper'

RSpec.describe "admin/armor_types/new", type: :view do
  before(:each) do
    assign(:admin_armor_type, Admin::ArmorType.new(
      :name => "MyString"
    ))
  end

  it "renders new admin_armor_type form" do
    render

    assert_select "form[action=?][method=?]", admin_armor_types_path, "post" do

      assert_select "input#admin_armor_type_name[name=?]", "admin_armor_type[name]"
    end
  end
end
