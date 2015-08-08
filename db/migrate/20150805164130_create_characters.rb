class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :spec, null: false

      t.timestamps null: false
    end
  end
end
