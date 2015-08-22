class RemoveStatusesFromOrderLines < ActiveRecord::Migration
  def change
    @paid_id = PaymentStatus.find_by(name: 'paid').id

    add_column :order_lines, :team_paid, :boolean, default: false, null: false
    add_column :order_lines, :order_paid, :boolean, default: false, null: false

    OrderLine.reset_column_information
    OrderLine.where(payment_status_id: @paid_id).update_all(team_paid: true)
    OrderLine.where(order: nil).update_all(order_paid: true)


    remove_column :order_lines, :order_line_status_id
    remove_column :order_lines, :payment_status_id
  end
end
