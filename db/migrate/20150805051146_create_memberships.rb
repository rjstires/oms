class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :team, index: true, foreign_key: true
      t.boolean :confirmed, null: false, default: false

      t.timestamps null: false
    end
  end
end
