class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :spec, null: false
      t.belongs_to :armor_type, index: true, foreign_key: true, null: false
      t.belongs_to :classification, index: true, foreign_key: true, null: false
      t.belongs_to :primary_stat, index: true, foreign_key: true, null: false
      t.belongs_to :tier_token, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
