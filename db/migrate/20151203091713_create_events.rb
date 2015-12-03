class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :cutoff_timestamp
      t.timestamp :event_timestamp
      t.references :team, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :zone, index: true, foreign_key: true
      t.references :difficulty, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
