json.array!(@events) do |event|
  eventColor = event.team.faction.name == "horde" ? "#ff9999" : "#9999ff" ;
  json.extract! event, :id, :title
  json.start event.start_datetime.utc.iso8601
  json.end (event.start_datetime + 4.hours).utc.iso8601
  json.display_start_time event.display_start_time
  json.display_end_time event.display_end_time
  json.display_tmz event.display_tmz
  json.team event.team.display_alias

  json.date event.date
  json.color eventColor
end
