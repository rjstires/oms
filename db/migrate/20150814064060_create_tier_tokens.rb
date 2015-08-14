class CreateTierTokens < ActiveRecord::Migration
  def change
    create_table :tier_tokens do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
