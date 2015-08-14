class CreateOrderLineStatuses < ActiveRecord::Migration
  def change
    create_table :order_line_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
