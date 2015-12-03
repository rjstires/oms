json.array!(@event_slots) do |event_slot|
  json.extract! event_slot, :id, :event_id, :title, :description, :character_id
  json.url event_slot_url(event_slot, format: :json)
end
