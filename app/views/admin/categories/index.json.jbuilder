json.array!(@categories) do |armor_type|
  json.extract! armor_type, :id, :name
  json.url admin_armor_type_url(armor_type, format: :json)
end
