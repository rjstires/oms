class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.belongs_to :product, null: false
      t.belongs_to :event, null: false
      t.belongs_to :order_line

      t.timestamps null: false
    end
  end
end
