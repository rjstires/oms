class CreateLootOptions < ActiveRecord::Migration
  def change
    create_table :loot_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
