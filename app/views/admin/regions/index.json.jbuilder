json.array!(@regions) do |region|
  json.extract! region, :id, :name
  json.url admin_region_url(region, format: :json)
end
