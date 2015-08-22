json.array!(@teams) do |team|
  json.extract! team, :id, :name
  json.url admin_team_url(team, format: :json)
end
