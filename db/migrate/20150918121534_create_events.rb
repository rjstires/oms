class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :team, null: false
      t.belongs_to :category, null: false
      t.belongs_to :difficulty, null: false
      t.belongs_to :zone, null: false
      t.datetime :start_datetime, null: false
      t.datetime :cutoff_datetime, null: false

      t.timestamps null: false
    end
  end
end
