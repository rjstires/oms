class CreateTeamStatuses < ActiveRecord::Migration
  def change
    create_table :team_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
