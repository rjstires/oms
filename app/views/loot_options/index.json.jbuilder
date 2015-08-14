json.array!(@loot_options) do |loot_option|
  json.extract! loot_option, :id, :name
  json.url loot_option_url(loot_option, format: :json)
end
