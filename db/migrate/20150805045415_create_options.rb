class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name, null: false
      t.string :type, null: false

      t.timestamps null: false
    end
  end
end
