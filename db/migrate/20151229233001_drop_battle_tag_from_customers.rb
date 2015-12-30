class DropBattleTagFromCustomers < ActiveRecord::Migration
  def change
    if column_exists?(:customers, :battle_tag)
      remove_column :customers, :battle_tag
    end
    
    if column_exists?(:customers, :skype)
      remove_column :customers, :skype
    end
  end
end
