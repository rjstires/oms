class AddDatesToOrderLine < ActiveRecord::Migration
  def change
    add_column :order_lines, :completed_at, :datetime
    add_column :order_lines, :scheduled_at, :datetime
  end
end
