class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description, null: false
      t.belongs_to :category, index: true, foreign_key: true, null: false
      t.belongs_to :zone, index: true, foreign_key: true, null: false
      t.belongs_to :play_style, index: true, foreign_key: true, null: false
      t.belongs_to :loot_option, index: true, foreign_key: true, null: false
      t.belongs_to :mount, index: true, foreign_key: true, null: false
      t.belongs_to :difficulty, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
