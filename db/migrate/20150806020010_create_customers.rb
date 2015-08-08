class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email, null: false
      t.string :battle_tag, null: false
      t.string :skype, null: false

      t.timestamps null: false
    end
  end
end
