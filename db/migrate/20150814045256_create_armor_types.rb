class CreateArmorTypes < ActiveRecord::Migration
  def change
    create_table :armor_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end