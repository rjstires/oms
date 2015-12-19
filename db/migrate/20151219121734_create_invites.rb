class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :team_id
      t.integer :sender_id
      t.integer :recipient_id
      t.string :email
      t.string :token

      t.timestamps null: false
    end
  end
end
