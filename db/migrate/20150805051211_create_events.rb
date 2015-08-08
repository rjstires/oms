class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.belongs_to :team, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
