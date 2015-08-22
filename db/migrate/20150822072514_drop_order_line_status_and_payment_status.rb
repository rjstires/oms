class DropOrderLineStatusAndPaymentStatus < ActiveRecord::Migration
  def change
    drop_table :order_line_statuses
    drop_table :payment_statuses
  end
end
