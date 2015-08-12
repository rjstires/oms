class AddFactionAndRegionToOrderLines < ActiveRecord::Migration
  def change
    add_column :order_lines, :faction_id, :integer, index: true, null: false
    add_column :order_lines, :region_id, :integer, index: true, null: false
  end
end
