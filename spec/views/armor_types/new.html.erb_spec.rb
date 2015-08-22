require 'rails_helper'

RSpec.describe "armor_types/new", type: :view do
  before(:each) do
    assign(:armor_type, ArmorType.new(
      :name => "MyString"
    ))
  end

  it "renders new armor_type form" do
    render

    assert_select "form[action=?][method=?]", armor_types_path, "post" do

      assert_select "input#armor_type_name[name=?]", "armor_type[name]"
    end
  end
end
