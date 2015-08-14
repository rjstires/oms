class CreateMounts < ActiveRecord::Migration
  def change
    create_table :mounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
