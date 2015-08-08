class AddCustomerToOrderLine < ActiveRecord::Migration
  def change
    add_reference :order_lines, :customer, index: true, foreign_key: true
  end
end
