json.array!(@team_statuses) do |team_status|
  json.extract! team_status, :id, :name
  json.url admin_team_status_url(team_status, format: :json)
end
