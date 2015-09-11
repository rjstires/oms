class CustomerSkypeIsNotRequired < ActiveRecord::Migration
  def change
    change_column_null :customers, :skype, true
  end
end
