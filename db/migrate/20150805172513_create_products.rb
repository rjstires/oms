class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description, null: false
      t.integer :category_id, index: true, foreign_key: true, null: false
      t.integer :zone_id, index: true, foreign_key: true, null: false
      t.integer :play_style_id, index: true, foreign_key: true, null: false
      t.integer :loot_option_id, index: true, foreign_key: true, null: false
      t.integer :mount_id, index: true, foreign_key: true, null: false
      t.integer :difficulty_id, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
