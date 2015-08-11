class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :name_alias, null: false
      t.string :realm, null: false
      t.string :payment_address, null: false
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.integer :region_id, index: true, foreign_key: true, null: false
      t.integer :faction_id, index: true, foreign_key: true, null: false
      t.integer :team_status_id, index: true, foreign_key: true, null: false
      t.integer :payment_type_id, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
