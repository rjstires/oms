class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order

      t.belongs_to :product, index: true, foreign_key: true, null: false
      t.belongs_to :team, index: true, foreign_key: true
      t.belongs_to :character, index: true, foreign_key: true, null: false
      t.belongs_to :customer, index: true, foreign_key: true, null: false
      t.belongs_to :faction, index: true, foreign_key: true, null: false
      t.belongs_to :region, index: true, foreign_key: true, null: false

      t.decimal :sale, null: false
      t.decimal :merchant_fee, null: false
      t.decimal :site_fee, null: false
      t.decimal :contractor_payment, null: false

      t.boolean :order_paid, default: false, null: false
      t.boolean :team_paid, default: false, null: false

      t.timestamps null: false
    end
  end
end
