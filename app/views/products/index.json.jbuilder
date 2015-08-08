json.array!(@products) do |product|
  json.extract! product, :id, :description, :category_id, :zone_id, :play_style_id, :loot_option_id, :mount_id, :difficulty_id
  json.url product_url(product, format: :json)
end
