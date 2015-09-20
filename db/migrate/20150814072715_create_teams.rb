class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :name_alias, null: false
      t.string :realm, null: false
      t.string :payment_address, null: false
      t.belongs_to :region, index: true, foreign_key: true, null: false
      t.belongs_to :faction, index: true, foreign_key: true, null: false
      t.belongs_to :team_status, index: true, foreign_key: true, null: false
      t.belongs_to :payment_type, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
