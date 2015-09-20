class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :battle_tag, :string
    add_column :users, :skype, :string
    add_column :users, :role, :integer
  end
end
