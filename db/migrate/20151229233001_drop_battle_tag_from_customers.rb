class DropBattleTagFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :battle_tag
    remove_column :customers, :skype
  end
end
