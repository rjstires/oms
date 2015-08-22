json.array!(@zones) do |zone|
  json.extract! zone, :id, :name
  json.url admin_zone_url(zone, format: :json)
end
