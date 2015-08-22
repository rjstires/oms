json.array!(@primary_stats) do |primary_stat|
  json.extract! primary_stat, :id, :name
  json.url admin_primary_stat_url(primary_stat, format: :json)
end
