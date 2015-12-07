json.products @products do |product|
  json.id product.id
  json.category product.category
  json.difficulty product.difficulty
  json.zone product.zone
  json.loot_option product.loot_option
  json.play_style product.play_style
  json.mount product.mount
  json.description product.description
end
