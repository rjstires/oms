class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email, null: false
      t.string :battle_tag
      t.string :skype

      t.timestamps null: false
    end
  end
end
