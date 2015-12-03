class CreateEventSlots < ActiveRecord::Migration
  def change
    create_table :event_slots do |t|
      t.references :event, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.references :character, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
