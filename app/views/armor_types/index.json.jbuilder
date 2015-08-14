json.array!(@armor_types) do |armor_type|
  json.extract! armor_type, :id
  json.url armor_type_url(armor_type, format: :json)
end
