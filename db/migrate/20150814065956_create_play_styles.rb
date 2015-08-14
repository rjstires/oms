class CreatePlayStyles < ActiveRecord::Migration
  def change
    create_table :play_styles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
