class AddContactsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :battle_tag, :string
    add_column :users, :skype, :string
  end
end
