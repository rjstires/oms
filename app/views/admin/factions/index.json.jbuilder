json.array!(@factions) do |faction|
  json.extract! faction, :id, :name
  json.url admin_faction_url(faction, format: :json)
end
