class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order
      t.belongs_to :product, index: true, foreign_key: true, null: false
      t.belongs_to :team, index: true, foreign_key: true
      t.belongs_to :character, index: true, foreign_key: true, null: false
      t.integer :order_line_status_id, index: true, null: false
      t.integer :payment_status_id, index: true, null: false
      t.decimal :sale, null: false
      t.decimal :merchant_fee, null: false
      t.decimal :site_fee, null: false
      t.decimal :contractor_payment, null: false

      t.timestamps null: false
    end
  end
end
