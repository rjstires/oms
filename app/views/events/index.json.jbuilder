json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :cutoff_timestamp, :event_timestamp, :team_id, :character_id
  json.url event_url(event, format: :json)
end
