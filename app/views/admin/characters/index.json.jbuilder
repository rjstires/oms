json.array!(@characters) do |armor_type|
  json.extract! armor_type, :id, :spec, :classifcation, :armor_type, :tier_token, :primary_stat
  json.url admin_armor_type_url(armor_type, format: :json)
end
