json.array!(@events) do |event|
  json.title event.calendar_title
  json.start event.event_timestamp
  json.eventPath team_event_url(@team, event)
  json.allDay 'false'
end
