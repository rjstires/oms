class CreatePrimaryStats < ActiveRecord::Migration
  def change
    create_table :primary_stats do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
