json.array!(@characters) do |character|
  json.extract! character, :id, :spec, :armor_type_id, :classification_id, :primary_stat_id, :tier_token_id
  json.url character_url(character, format: :json)
end
