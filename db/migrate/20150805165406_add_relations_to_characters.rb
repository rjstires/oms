class AddRelationsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :armor_type_id, :integer, index: true
    add_column :characters, :classification_id, :integer, index: true
    add_column :characters, :primary_stat_id, :integer, index: true
    add_column :characters, :tier_token_id, :integer, index: true
  end
  
end
